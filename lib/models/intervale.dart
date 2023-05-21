class CoordinateInterval {
  final double startLatitude;
  final double startLongitude;
  final double endLatitude;
  final double endLongitude;

  CoordinateInterval({
    required this.startLatitude,
    required this.startLongitude,
    required this.endLatitude,
    required this.endLongitude,
  });

  factory CoordinateInterval.fromJson(Map<String, dynamic> json) {
    return CoordinateInterval(
      startLatitude: json['startLatitude'],
      startLongitude: json['startLongitude'],
      endLatitude: json['endLatitude'],
      endLongitude: json['endLongitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startLatitude': startLatitude,
      'startLongitude': startLongitude,
      'endLatitude': endLatitude,
      'endLongitude': endLongitude,
    };
  }
}
