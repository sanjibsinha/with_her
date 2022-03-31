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
  var city = 'Your ';
  var description = 'Good Weather ';

  @override
  Widget build(BuildContext context) {
    UserLocation location = UserLocation();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Get City and Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to ${city.toString()} city!',
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
              onPressed: () {
                location.getCityName().then((result) {
                  setState(() {
                    city = result;
                  });
                });
                location.getWeather().then((result) {
                  setState(() {
                    description = result;
                  });
                });
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
