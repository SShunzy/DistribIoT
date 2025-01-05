import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../classes/vending_machine_small.dart';

class VendingMachineMarker extends Marker{
  VendingMachineMarker({required this.vendingMachine})
      : super(
      alignment: Alignment.topCenter,
      height: VendingMachineSmall.size,
      width: VendingMachineSmall.size,
      point: LatLng(vendingMachine.lat, vendingMachine.long),
      child: const Icon(Icons.location_on, color: Colors.red, size: VendingMachineSmall.size,)
  );

  final VendingMachineSmall vendingMachine;
}
