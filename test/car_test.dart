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
    late User testUser;
    List<Coche> allCoches = [];

    setUp(() async {
      facade = CarFacade();
      testUser = User(id: 7, name: "Test");
      apiClient = ApiClient();
      capacidad = 100.0;
      gastoKm = 10.0;
      carData = {
        'modelo': 'Modelo',
        'tipoCombustible': '',
        'capacidad': capacidad,
        'gastoKm': gastoKm,
      };

      await facade.setUser(testUser);
      allCoches = facade.getCars();
      if (allCoches.isNotEmpty) {
        int i = allCoches.length - 1;
        while (i >= 0) {
          await facade.deleteCar(i);
          i--;
        }
      }

      await facade.buildCar(carData);
      carData['modelo'] = 'Modelo2';
      await facade.buildCar(carData);
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
