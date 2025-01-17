import 'package:flutter_app/classes/product_class.dart';
import 'package:flutter_app/classes/review_class.dart';

class VendingMachine{
  static const double size = 48;

  VendingMachine({
    required this.machineId,
    required this.name,
    required this.lat,
    required this.long,
    required this.types,
    required this.productsList,
    required this.reviewsList
  });

  final String machineId;
  final String name;
  final double lat;
  final double long;
  final List<String> types;
  final List<ProductClass> productsList;
  final List<ReviewClass> reviewsList;

  factory VendingMachine.fromJson(Map<String, dynamic> json) => VendingMachine(
      machineId: json['machineId'],
      name: json['machineName'],
      types: (json['types']as List<dynamic>).cast<String>(),
      lat: json['position']['latitude'],
      long: json['position']['longitude'],
      productsList: List<dynamic>.from(json['productsList'])
        .map((i) => ProductClass.fromJson(i))
        .toList(),
      reviewsList : List<dynamic>.from(json['reviewsList'])
      .map((i) => ReviewClass.fromJson(i))
      .toList()
  );
}