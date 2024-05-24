//Clase coche
//Los atributos late es que se declaran mas tarde
import 'dart:convert';

enum Combustible { gas, hib, elec }

class Coche {
  late int id;
  late String modelo;
  late Combustible tipoCombustible;
  late double autonomia;
  double tiempoRecarga = 0;
  double costeRecarga = 0;
  bool modificado = false;
  late int userId = -1;

  String getDescripcion() {
    return "Modelo: $modelo\nTipo de combustible: $tipoCombustible\n"
        "Autonomía: $autonomia km\nTiempo de recarga: $tiempoRecarga h\n"
        "Coste de recarga: $costeRecarga €\n";
  }

  static Coche fromJson(Map<String, dynamic> json) {
    Coche coche = Coche();
    coche.id = json['id'];
    coche.modelo = json['model'];
    switch (json['gas_type']) {
      case 'Gasolina':
        coche.tipoCombustible = Combustible.gas;
        break;
      case 'Hibrido':
        coche.tipoCombustible = Combustible.hib;
        break;
      case 'Electrico':
        coche.tipoCombustible = Combustible.elec;
        break;
      default:
        throw Exception('Wrong fuel type: ${json['gas_type']}');
    }
    coche.autonomia = double.parse(json['autonomy']);
    coche.tiempoRecarga = double.parse(json['refuel_time']);
    coche.costeRecarga = double.parse(json['refuel_cost']);
    coche.modificado = json['is_modified'];
    coche.userId = json['user_id'];
    return coche;
  }

  static String toJson(Coche coche) {
    String gas_type;
    switch (coche.tipoCombustible) {
      case Combustible.gas:
        gas_type = "Gasolina";
        break;
      case Combustible.hib:
        gas_type = "Hibrido";
        break;
      case Combustible.elec:
        gas_type = "Electrico";
        break;
      default:
        throw Exception('Wrong fuel type: ${coche.tipoCombustible}');
    }
    final Map<String, dynamic> json = {
      "user_id": coche.userId,
      "model": coche.modelo,
      "gas_type": gas_type,
      "autonomy": coche.autonomia,
      "refuel_time": coche.tiempoRecarga,
      "refuel_cost": coche.costeRecarga,
      "is_modified": coche.modificado
    };
    return jsonEncode(json);
  }
}
