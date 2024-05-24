import 'package:concesionario_tunning/api_client.dart';
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
import 'package:concesionario_tunning/user/user.dart';

class CarFacade {
  List<Coche> _cars = [];
  User _user = User(id: -1, name: 'nulo');
  final ApiClient _apiClient = ApiClient();

  Future<void> buildCar(Map<String, dynamic> carData) async {
    if (_user.id != -1) {
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

      Coche coche = builder.getResultado();
      coche.userId = _user.id;
      await _apiClient.addCoche(coche);
      await _apiClient
          .getCochesUsuario(_user.id)
          .then((value) => _cars = value);
    }
  }

  void throwException(String message) {
    throw Exception(message);
  }

  Future<void> deleteCar(int index) async {
    if (index >= _cars.length) throwException('Car not found');
    await _apiClient.deleteCoche(_cars[index].id);
    await _apiClient.getCochesUsuario(_user.id).then((value) => _cars = value);
  }

  void sortCars(bool upward) {
    _cars.sort((a, b) =>
        upward ? a.modelo.compareTo(b.modelo) : b.modelo.compareTo(a.modelo));
  }

  List<Coche> filterCars(String modelo) {
    return _cars.where((car) => car.modelo.contains(modelo)).toList();
  }

  Future<void> modifyCar(int strategy, int index) async {
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
    await _apiClient.updateCoche(_cars[index]);
    await _apiClient.getCochesUsuario(_user.id).then((value) => _cars = value);
  }

  User getUser() {
    return _user;
  }

  Future<void> setUser(User? user) async {
    if (user != null) {
      _user = user;
      await _apiClient
          .getCochesUsuario(_user.id)
          .then((value) => _cars = value);
    }
  }

  List<Coche> getCars() {
    return _cars;
  }

  void setCars(List<Coche> list) {
    _cars = list;
  }
}
