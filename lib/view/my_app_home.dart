import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:with_her/model/location.dart';

class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  var apiKey = '4d3565f5da5cc784bf9f20f990fb8399';
  double lat = 22.5892652;
  double lon = 88.3056119;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    final httpsUri = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather',
        fragment: 'numbers');
    /* var uri = Uri.http(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&$lon&appid=$apiKey',
        unencodedPath); */

    var request = await http.get(httpsUri);
    if (request.statusCode == 200) {
      String data = request.body.toString();
      var city = jsonDecode(data)['name'];
      var description = jsonDecode(data)['weather'][0]['description'];
      print('Welcome to $city city!');
      print('Weather: $description');
    } else {
      print(request.statusCode);
      print(
          'Latitude is: $lat *** Longitude is: $lon'); // this prints longitude and latitude values
      print(
          'request $httpsUri'); // when I entered the url in postman, I'm getting the same error 400
    }
  }

  void getLocation() async {
    UserLocation location = UserLocation();
    await location.getLocationWithGeolocator();
    lat = location.latitude;
    lon = location.longitude;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XXX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'We\'re trying to find the Lat and Lang:',
            ),
            Text(
              'Location',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getLocation();
          getData();
        },
        tooltip: 'Get Location',
        child: const Icon(Icons.location_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
