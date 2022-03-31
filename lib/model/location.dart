import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class UserLocation {
  String apiKey = 'Secret Key';
  double lat = 40.7128;
  double lon = 74.0060;

  Future<void> getLocationWithGeolocator() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<String> getCityName() async {
    final httpsUri = Uri.http('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '$lat',
      'lon': '$lon',
      'appid': apiKey,
    });

    var request = await http.get(httpsUri);
    if (request.statusCode == 200) {
      String data = request.body.toString();
      var city = jsonDecode(data)['name'];

      return city;
    } else {
      return '${request.statusCode}';
    }
  }

  Future<String> getWeather() async {
    final httpsUri = Uri.http('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '$lat',
      'lon': '$lon',
      'appid': apiKey,
    });

    var request = await http.get(httpsUri);
    if (request.statusCode == 200) {
      String data = request.body.toString();
      var description = jsonDecode(data)['weather'][0]['description'];

      return description;
    } else {
      return '${request.statusCode}';
    }
  }
}
