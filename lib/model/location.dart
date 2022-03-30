import 'package:geolocator/geolocator.dart';

class UserLocation {
  double longitude = 88.3056119;
  double latitude = 22.5892652;

  Future<void> getLocationWithGeolocator() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
