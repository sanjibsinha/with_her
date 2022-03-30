import 'package:geolocator/geolocator.dart';

class UserLocation {
  double? longitude;
  double? latitude;

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
