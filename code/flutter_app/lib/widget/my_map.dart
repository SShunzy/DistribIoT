import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MyMap extends StatelessWidget{
  final LatLng centerPosition;
  final List<Marker> markers;
  final MapController mapController;
  const MyMap({super.key, required this.centerPosition, required this.markers,required this.mapController});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: centerPosition,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(markers: markers)
      ]
    );
  }

}