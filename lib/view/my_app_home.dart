import 'package:flutter/material.dart';

import '../model/location.dart';
import 'weather_page.dart';

/// this is sixth step and last one on Future
///
class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  UserLocation location = UserLocation();

  @override
  void initState() {
    super.initState();
    updateWeather();
  }

  void updateWeather() {
    var weather;
    location.getWeatherWithGeolocator().then((value) {
      weather = value;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherPage(
          weather: weather,
          title: 'Get City and Weather',
        );
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
