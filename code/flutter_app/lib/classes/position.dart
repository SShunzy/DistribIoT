class Position{
    const Position({
      required this.lat,
      required this.long,
  });
  final double lat;
  final double long;

  factory Position.fromJson(Map<String, dynamic> json) => Position(lat: json['latitude'], long: json['longitude']);
}