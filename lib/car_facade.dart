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
        String message =
            'Tipo de combustible incorrecto: ${carData['tipoCombustible']}';
        throwException(message);
    }

    if (carData['capacidad'] < 0 || carData['gastoKm'] < 0) {
      throw Exception('Valores del modelo incorrectos');
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

  void importCars(List<Coche> cars) {
    if (cars.isEmpty) {
      throwException('La lista está vacía');
    } else {
      for (var coche in cars) {
        if (coche.modelo.isEmpty) {
          throwException('El modelo del coche está vacío');
        }
        if (coche.tipoCombustible != Combustible.gas &&
            coche.tipoCombustible != Combustible.hib &&
            coche.tipoCombustible != Combustible.elec) {
          throwException('El tipo de combustible del coche no está definido');
        }
        if (coche.autonomia <= 0) {
          throwException('La autonomía del coche debe ser mayor que cero');
        }
      }
      _cars.clear();
      _cars.addAll(cars);
    }
  }
}
