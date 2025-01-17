class VendingMachineSmall{
  static const double size = 48;

  VendingMachineSmall({
    required this.machineId,
    required this.name,
    required this.lat,
    required this.long,
    required this.types
  });
  final String machineId;
  final String name;
  final double lat;
  final double long;
  final List<String> types;

  factory VendingMachineSmall.fromJson(Map<String, dynamic> json) => VendingMachineSmall(
    machineId: json['machineId'],
    name: json['machineName'],
    types: (json['types']as List<dynamic>).cast<String>(),
    lat: json['position']['latitude'],
    long: json['position']['longitude'],
  );
}