import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

/// this is seventh step
///

class UserLocation {
  Future<dynamic> getWeatherWithGeolocator() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      double lat = position.latitude;
      double lon = position.longitude;
      var data = getWeatherData(lat, lon, 'Secret Key');
      return data;
    } catch (e) {
      e;
    }
  }

  Future<dynamic> getWeatherData(double lat, double lon, String apiKey) async {
    final httpsUri = Uri.http('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '$lat',
      'lon': '$lon',
      'appid': apiKey,
    });

    var request = await http.get(httpsUri);
    if (request.statusCode == 200) {
      String data = request.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      '${request.statusCode}';
    }
  }
}
