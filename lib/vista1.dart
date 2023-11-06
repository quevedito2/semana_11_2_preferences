import 'package:flutter/material.dart';
import 'package:semana_11_2_preferences/vista2.dart';

class Vista1 extends StatefulWidget {
  const Vista1({Key? key}) : super(key: key);
  //const Vista1({super.key});

  @override
  _Vista1State createState() => _Vista1State();
  //State<Vista1> createState() => _Vista1State();
}

class _Vista1State extends State<Vista1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferences"),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Vista2();
          }));
        },
      ),
    );
  }
}
