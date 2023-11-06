import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  SharedPreferences? preferencia;
  bool wifi = false;
  String red = "";

  Future<SharedPreferences?> get preferences async {
    if (preferencia == null) {
      preferencia = await SharedPreferences.getInstance();
      wifi = preferencia?.getBool("wifi") ?? false;
      red = preferencia?.getString("red") ?? "";
    }
    return preferencia;
  }

  Future<Preferencias> init() async {
    preferencia = await preferences;
    return this;
  }

  Future<void> guardarWifi() async {
    await preferencia?.setBool("wifi", wifi);
  }

  Future<void> guardarRed() async {
    await preferencia?.setString("red", red);
  }
}
