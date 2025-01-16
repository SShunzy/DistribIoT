import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/classes/vending_machine_small.dart';
import 'package:flutter_app/widget/vending_machine_marker.dart';
import 'package:flutter_app/widget/vending_machine_marker_popup.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import '../classes/app_properties.dart'as properties;

class MapWidget extends StatefulWidget{
  const MapWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget>{
  final PopupController _popupLayerController = PopupController();
  late MapController mapController;
  Position? _position;

  static Future<List<VendingMachineSmall>> _fetchVendingMachine() async{
    final uri = Uri.parse("${properties.apiUrl}/machines");
    final response = await http.get(uri);
    final List body = json.decode(response.body);
    debugPrint("json = $body");
    return body.map((e){
      return VendingMachineSmall.fromJson(e);
    }).toList();
  }

  Future<List<VendingMachineSmall>> machineList = _fetchVendingMachine();

  @override
  void initState(){
    super.initState();
    _getCurrentLocation();
    setState(() {
      mapController = MapController();
    });
  }

  void _getFABCurrentLocation()async {
    Position position = await _determinePosition();
    _position = position;
    double zoom = 15.0; //the zoom you want
    mapController.move(LatLng(_position!.latitude,_position!.longitude),zoom);
  }

  Future<void> _getCurrentLocation() async {
    Position position = await _determinePosition();
    _position = position;
    double zoom = 15.0; //the zoom you want
    mapController.move(LatLng(_position!.latitude,_position!.longitude),zoom);
    debugPrint("POSITION: $_position");
  }

  Future<Position> _determinePosition() async {
    debugPrint('_determinePosition triggered');
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location Permissions are denied.');
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
      timeLimit: const Duration(seconds: 15)
    );
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: machineList,
        builder: (context,AsyncSnapshot<List<VendingMachineSmall>>dataSnapshot){
          if(dataSnapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(dataSnapshot.hasData){
            return FutureBuilder(
                future: _getCurrentLocation(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else{
                    return Scaffold(
                      body: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                            onTap: (_, __) => _popupLayerController.hideAllPopups(),
                            initialCenter: LatLng(
                              _position != null ? _position!.latitude : 50.61992,
                              _position != null ? _position!.longitude : 5.58165,
                            ),
                            initialZoom: 15.0,
                            minZoom: 4.0,
                            maxZoom: 18.0
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                          ),
                          MarkerLayer(
                              markers: [
                            Marker(
                              point: LatLng(
                                _position != null ? _position!.latitude : 50.61992,
                                _position != null ? _position!.longitude : 5.58165,
                            ),
                              child: const Icon(Icons.navigation, size: 48,))]
                          ),
                          PopupMarkerLayer(
                            options: PopupMarkerLayerOptions(
                                markers:
                                dataSnapshot.data!.map((e){
                                  return VendingMachineMarker(
                                      vendingMachine: VendingMachineSmall(
                                          id:e.id,
                                          machineId: e.machineId,
                                          name: e.name,
                                          lat: e.lat,
                                          long: e.long,
                                          types: e.types
                                      )
                                  );
                                }
                                ).toList(),
                                popupController: _popupLayerController,
                                popupDisplayOptions: PopupDisplayOptions(
                                    builder: (_, Marker marker) {
                                      if(marker is VendingMachineMarker) {
                                        return  VendingMachineMarkerPopup(vendingMachine: marker.vendingMachine);
                                      }
                                      return const Card(child: Text('Not a Vending Machine'));
                                    }
                                )
                            ),
                          )
                        ],
                      ),
                      floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          debugPrint('Floating action button pressed.');
                          _getFABCurrentLocation();
                        },
                        tooltip: "Center map to current location",
                        child: const Icon(Icons.my_location),
                      ),
                    );
                  }
                });
          }
          else{
            debugPrint("Snapshot = $dataSnapshot");
            return const Center(
              child: Text("No data available"),
            );
          }
        }
    );
  }
}