import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    print("Getting location...");
    try {
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
      Position position = await geolocator.
        getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
    print("Location printed");
  }
}