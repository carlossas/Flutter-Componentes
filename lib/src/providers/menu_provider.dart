//Libreria para convertir JSONS
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final res = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(res);
    opciones = dataMap['rutas'];
    // print(opciones);

    return opciones;
  }
}

final menuProvider = new _MenuProvider();
