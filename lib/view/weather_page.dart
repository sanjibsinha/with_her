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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2022/02/19/22/48/forest-7023487_960_720.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to ${widget.weather['name']}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'Current temperature: ${(widget.weather['main']['temp'] - 273.15).toStringAsFixed(2)} Celsius',
                  //'Current temperature: ${widget.weather['main']['temp']}) Celsius',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'Current condition: ${widget.weather['weather'][0]['description']}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
