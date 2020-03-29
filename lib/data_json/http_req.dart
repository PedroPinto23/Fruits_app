import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muxidev/data_json/lista.dart';

class Frutas {
  Future<List<ListaDeFrutas>> getFrutas() async {
    http.Response res = await http.get(
        'https://raw.githubusercontent.com/muxidev/desafio-android/master/fruits.json');
    return decode(res);
  }

  List<ListaDeFrutas> decode(http.Response res) {
    if (res.statusCode == 200) {
      var decoded = json.decode(res.body);
      List<ListaDeFrutas> frutas = decoded['fruits'].map<ListaDeFrutas>((f) {
        return ListaDeFrutas.fromJson(f);
      }).toList();
      return frutas;
    } else {
      throw Exception("erro ao carregar");
    }
  }
}
