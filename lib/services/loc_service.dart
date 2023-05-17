import 'package:geolocator/geolocator.dart';

class LocationHelper {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw Exception(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  CoordinateInterval getCoordinateInterval(Position position) {
    double startLatitude = position.latitude - 0.01;
    double startLongitude = position.longitude -0.01;

    double endLatitude = position.latitude + 0.01;
    double endLongitude = position.longitude + 0.01;

    return CoordinateInterval(
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      endLatitude: endLatitude,
      endLongitude: endLongitude,
    );
  }

  bool isLocationWithinInterval(
      Position position, CoordinateInterval interval) {
    double latitude = position.latitude;
    double longitude = position.longitude;

    return (latitude >= interval.startLatitude &&
        latitude <= interval.endLatitude &&
        longitude >= interval.startLongitude &&
        longitude <= interval.endLongitude);
  }
}

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
}
