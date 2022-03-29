import 'package:flutter/material.dart';
import 'package:with_her/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  static const routeName = '/first-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          width: 400.0,
          height: 150.0,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              );
            },
            child: const Text('Go to Second Page'),
          ),
        ),
      ),
    );
  }
}
