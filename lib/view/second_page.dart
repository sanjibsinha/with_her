import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  static const routeName = '/second-page';

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('I am called first, after each State object has been created.');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('The state object removed from the tree');
  }

  @override
  Widget build(BuildContext context) {
    print('I am called after initState() method.');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          width: 400.0,
          height: 150.0,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go to Frist Page'),
          ),
        ),
      ),
    );
  }
}
