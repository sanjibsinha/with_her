import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/location.dart';

/// expleining json
///
class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  UserLocation location = UserLocation();
  var city = '';
  var description = '';

  @override
  void initState() {
    super.initState();
    var description;
    location.getWeatherWithGeolocator().then((value) {
      description = value;
      print(description);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              city.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              description.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () async {
                city = await location.getCitynameWithGeolocator();
                setState(() {
                  city = city;
                });
                description =
                    await location.getWeatherDescriptionWithGeolocator();
                setState(() {
                  description = description;
                });
                /* location.getCitynameWithGeolocator().then((result) {
                  setState(() {
                    city = result;
                  });
                }); */
                /* location.getWeatherDescriptionWithGeolocator().then((result) {
                  setState(() {
                    description = result;
                  });
                }); */
              },
              child: const Text(
                'Get City and Current Weather',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
