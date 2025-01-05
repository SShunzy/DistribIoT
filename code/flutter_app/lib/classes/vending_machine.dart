import 'package:flutter_app/classes/product_class.dart';

class VendingMachine{
  static const double size = 48;

  VendingMachine({
    required this.id,
    required this.machineId,
    required this.name,
    required this.lat,
    required this.long,
    required this.productsList,
  });

  final String machineId;
  final String id;
  final String name;
  final double lat;
  final double long;
  final List<ProductClass> productsList;

  factory VendingMachine.fromJson(Map<String, dynamic> json) => VendingMachine(
      id: json['id'],
      machineId: json['machineId'],
      name: json['machineName'],
      lat: json['position']['latitude'],
      long: json['position']['longitude'],
      productsList: List<dynamic>.from(json['productsList'])
        .map((i) => ProductClass.fromJson(i))
        .toList()
  );
}