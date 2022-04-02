import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

/// this is sixth step
///

class UserLocation {
  Future<String> getCitynameWithGeolocator() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      double lat = position.latitude;
      double lon = position.longitude;
      return getCityName(lat, lon, 'Secret');
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getWeatherDescriptionWithGeolocator() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      double lat = position.latitude;
      double lon = position.longitude;
      return getWeatherDescription(lat, lon, 'Secret');
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getCityName(double lat, double lon, String apiKey) async {
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

  Future<String> getWeatherDescription(
      double lat, double lon, String apiKey) async {
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

  Future getWeatherWithGeolocator() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      double lat = position.latitude;
      double lon = position.longitude;
      var data = getWeatherData(lat, lon, 'Secret');
      return data;
    } catch (e) {
      e;
    }
  }

  Future getWeatherData(double lat, double lon, String apiKey) async {
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
