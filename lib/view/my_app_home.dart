import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:with_her/model/location.dart';

class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  void getLocation() async {
    UserLocation location = UserLocation();

    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var url = Uri.https(
      'https://api.openweathermap.org',
      '/data/2.5/weather?lat=22.5892652&lon=88.3056119&appid=4d3565f5da5cc784bf9f20f990fb8399',
    );
    try {
      Response response = await get(url);
      print(response);
    } catch (e) {
      print(e);
    }

    /* var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      //var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $jsonResponse.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    } */
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
