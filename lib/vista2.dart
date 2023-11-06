import 'package:flutter/material.dart';
import 'package:semana_11_2_preferences/pref/preferencias.dart';

class Vista2 extends StatefulWidget {
  const Vista2({Key? key}) : super(key: key);
  //const Vista2({super.key});

  @override
  _Vista2State createState() => _Vista2State();
  //State<Vista2> createState() => _Vista2State();
}

class _Vista2State extends State<Vista2> {
  Preferencias pref = Preferencias();

  @override
  Widget build(BuildContext context) {
    TextEditingController usuController = TextEditingController(text: pref.red);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajustes"),
        backgroundColor: Colors.blueAccent,
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.wifi),
                ),
                Expanded(child: Text("Activar Wifi")),
                Switch(
                    value: pref.wifi,
                    onChanged: (value) {
                      setState(() {
                        pref.wifi = value;
                        pref.guardarWifi();
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.signal_cellular_0_bar),
                ),
                Expanded(child: Text("Ingrese Red")),
                Container(
                  width: 120,
                  child: TextField(
                    controller: usuController,
                    onChanged: (value) {
                      setState(() {
                        pref.red = value;
                        pref.guardarRed();
                      });
                    },
                  ),
                )
              ],
            ),
            SwitchListTile(
              title: const Text("Bluetooth"),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text("GPS"),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text("Datos móviles"),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }

//Metodo de sobrescritura
  @override
  void initState() {
    pref.init().then((value) {
      setState(() {
        pref = value;
      });
    });
  }
}
