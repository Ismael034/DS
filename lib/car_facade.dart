import 'package:concesionario_tunning/builder/builder.dart';
import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/builder/director.dart';
import 'package:concesionario_tunning/strategy/context.dart';
import 'package:concesionario_tunning/strategy/strategies/estrategia_confort.dart';
import 'package:concesionario_tunning/strategy/strategies/estrategia_deportivo.dart';
import 'package:concesionario_tunning/strategy/strategies/estrategia_familiar.dart';

import 'package:concesionario_tunning/builder/car_builders/builder_electrico.dart';
import 'package:concesionario_tunning/builder/car_builders/builder_gasolina.dart';
import 'package:concesionario_tunning/builder/car_builders/builder_hibrido.dart';

class CarFacade {
  final List<Coche> _cars = [];

  void buildCar(Map<String, dynamic> carData) {
    late CarBuilder builder;
    late Director director;

    switch (carData['tipoCombustible']) {
      case 'Gasolina':
        builder = BuilderGasolina();
        break;
      case 'Hibrido':
        builder = BuilderHibrido();
        break;
      case 'Electrico':
        builder = BuilderElectrico();
        break;
      default:
        String message = 'Wrong fuel type: ${carData['tipoCombustible']}';
        throwException(message);
    }

    if (carData['capacidad'] < 0 || carData['gastoKm'] < 0) {
      throw Exception('Incorrect model values');
    }

    director = Director(builder);
    director.construir(
        carData['modelo'], carData['capacidad'], carData['gastoKm']);
    _cars.add(builder.getResultado());
  }

  void throwException(String message) {
    throw Exception(message);
  }

  void deleteCar(int index) {
    if (index >= _cars.length) throwException('Car not found');
    _cars.removeAt(index);
  }

  void sortCars(bool upward) {
    _cars.sort((a, b) =>
        upward ? a.modelo.compareTo(b.modelo) : b.modelo.compareTo(a.modelo));
  }

  List<Coche> filterCars(String modelo) {
    return _cars.where((car) => car.modelo.contains(modelo)).toList();
  }

  void modifyCar(int strategy, int index) {
    if (_cars[index].modificado) throwException('Car already modified');
    Context context;
    switch (strategy) {
      case 0:
        context = Context(EstrategiaDeportivo());
        context.modifyCar(_cars[index]);
        break;
      case 1:
        context = Context(EstrategiaFamiliar());
        context.modifyCar(_cars[index]);
        break;
      case 2:
        context = Context(EstrategiaConfort());
        context.modifyCar(_cars[index]);
        break;
    }
  }

  List<Coche> getCars() {
    return _cars;
  }
}
