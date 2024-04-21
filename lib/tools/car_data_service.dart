import 'dart:convert';
import 'package:concesionario_tunning/builder/coche.dart';
import 'package:flutter/services.dart';

class CarDataService {
  static Future<List<Map<String, dynamic>>> getAvailableModels() async {
    String jsonString = await _loadJsonFromAsset('assets/json/car_models.json');
    return jsonDecode(jsonString).cast<Map<String, dynamic>>();
  }

  static Future<List<String>> getAvailableModelsByCombustible(Combustible combustibleType) async {
    final List<Map<String, dynamic>> allModels = await getAvailableModels();
    List<String> filteredModels = [];
    for (var car in allModels) {
      switch (combustibleType) {
        case Combustible.gas:
          if (car['tipoCombustible'] == "Gasolina") {
            filteredModels.add(car['modelo']);
          }
          break;
        case Combustible.elec:
          if (car['tipoCombustible'] == "Electrico") {
            filteredModels.add(car['modelo']);
          }
          break;
        case Combustible.hib:
          if (car['tipoCombustible'] == "Hibrido") {
            filteredModels.add(car['modelo']);
          }
          break;
      }
    }
    return filteredModels;
  }

  static Future<Map<String, dynamic>> getCarByModel(String model) async {
    final List<Map<String, dynamic>> allModels = await getAvailableModels();
    Map<String, dynamic> filteredModels = {};
    for (var car in allModels) {
      if (car['modelo'] == model) {
        filteredModels = car;
      }
    }
    return filteredModels;
  }

  static Future<String> _loadJsonFromAsset(String assetPath) async {
    return await rootBundle.loadString(assetPath);
  }
}
