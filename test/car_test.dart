import 'package:flutter_test/flutter_test.dart';
import 'package:concesionario_tunning/car_facade.dart';
import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/user/user.dart';
import 'package:concesionario_tunning/api_client.dart';

void main() {
  group('CarFacade', () {
    late CarFacade facade;
    late ApiClient apiClient;
    late Map<String, dynamic> carData;
    late double capacidad;
    late double gastoKm;
    List<User> users = [];
    List<Coche> allCoches = [];

    setUp(() async {
      facade = CarFacade();
      apiClient = ApiClient();
      users = [User(id: 0, name: "a")];
      await facade.setUser(users[0]); // Ensure await is used here
      capacidad = 100.0;
      gastoKm = 10.0;
      carData = {
        'modelo': 'Modelo',
        'tipoCombustible': '',
        'capacidad': capacidad,
        'gastoKm': gastoKm,
      };
    });

    tearDown(() {
      int i = facade.getCars().length - 1;
      while (facade.getCars().isNotEmpty) {
        facade.deleteCar(i);
        i--;
      }
    });

    test('Gasoline vehicle creation test', () async {
      allCoches = await apiClient.getCochesUsuario(facade.getUser().id);
      facade.setCars(allCoches);
      carData['tipoCombustible'] = 'Gasolina';
      await facade.buildCar(carData);
      allCoches = facade.getCars();
      expect(allCoches.first.tipoCombustible, Combustible.gas);
      expect(allCoches.first.autonomia, capacidad * gastoKm);
      expect(allCoches.first.tiempoRecarga, 0);
      expect(allCoches.first.costeRecarga, capacidad * 1.2);
    });

    test('Hybrid vehicle creation test', () async {
      allCoches = await apiClient.getCochesUsuario(facade.getUser().id);
      facade.setCars(allCoches);
      carData['tipoCombustible'] = 'Hibrido';
      await facade.buildCar(carData);
      allCoches = facade.getCars();
      expect(allCoches.first.tipoCombustible, Combustible.hib);
      expect(allCoches.first.autonomia, (capacidad * gastoKm) * 1.1);
      expect(allCoches.first.tiempoRecarga, capacidad / 3);
      expect(allCoches.first.costeRecarga, capacidad * 1.2);
    });

    test('Electric vehicle creation test', () async {
      allCoches = await apiClient.getCochesUsuario(facade.getUser().id);
      facade.setCars(allCoches);
      carData['tipoCombustible'] = 'Electrico';
      await facade.buildCar(carData);
      allCoches = facade.getCars();
      expect(allCoches.first.tipoCombustible, Combustible.elec);
      expect(allCoches.first.autonomia, capacidad * gastoKm);
      expect(allCoches.first.tiempoRecarga, capacidad / 3);
      expect(allCoches.first.costeRecarga, capacidad * 0.1);
    });

    test('Wrong fuel type test', () async {
      carData['tipoCombustible'] = 'Wrong';
      expect(() => facade.buildCar(carData), throwsException);
    });

    test('Incorrect capacity value', () async {
      carData['capacidad'] = -1;
      expect(() => facade.buildCar(carData), throwsException);
    });

    test('Incorrect consumption value', () async {
      carData['gastoKm'] = -1;
      expect(() => facade.buildCar(carData), throwsException);
    });
  });
}
