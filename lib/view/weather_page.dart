import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.weather, required this.title})
      : super(key: key);

  final dynamic weather;
  final String title;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
              widget.weather['name'],
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              widget.weather['weather'][0]['description'],
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
