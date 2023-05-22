import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../models/intervale.dart';
import '../utils/database_roots.dart';

class IntervalService { 

  Future<List<CoordinateInterval>> getAllIntervales() async {
    final QuerySnapshot<Object?> querySnapshot =
        await DatabaseRoutes.INTERVAL_DATABASES.get();

    return querySnapshot.docs
        .map((doc) => CoordinateInterval.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

  }

  Future<CoordinateInterval?> getCoordinateIntervalById(String id) async {
    final intervalRef = DatabaseRoutes.INTERVAL_DATABASES.doc(id);
    final intervalSnapshot = await intervalRef.get();
    if (intervalSnapshot.exists) {
      final intervalData = intervalSnapshot.data() as Map<String, dynamic>;
      return CoordinateInterval.fromJson(intervalData);
    } else {
      return null;
    }
  }
  
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

  CoordinateInterval createCoordinateInterval(Position position) {
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


  Future<bool> isDouarExist()async {
    List<CoordinateInterval> coordinateIntervals = await getAllIntervales();
    Position currentPosition = await getCurrentLocation();
    for (CoordinateInterval interval in coordinateIntervals ){
      bool isPositionInInterval = isLocationWithinInterval(currentPosition, interval);
      if (isPositionInInterval) return isPositionInInterval;
    }
    return false;

  }
}


