import 'package:concesionario_tunning/user/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concesionario_tunning/car_facade.dart';
import 'package:concesionario_tunning/builder/coche.dart';

void main() {
  group('CarFacade', () {
    late CarFacade facade;
    late dynamic carData;
    late double capacidad;
    late double gastoKm;
    late User testUser;

    setUp(() async {
      facade = CarFacade();
      testUser = User(id: 7, name: "Test");
      capacidad = 100.0;
      gastoKm = 10.0;
      carData = {
        'modelo': 'Modelo',
        'tipoCombustible': '',
        'capacidad': capacidad,
        'gastoKm': gastoKm,
      };

      await facade.setUser(testUser);
      final allCoches = facade.getCars();
      if (allCoches.isNotEmpty) {
        int i = allCoches.length - 1;
        while (i >= 0) {
          await facade.deleteCar(i);
          i--;
        }
      }
    });
    test('Gasoline vehicle creation test', () async {
      carData['tipoCombustible'] = 'Gasolina';
      await facade.buildCar(carData);
      expect(facade.getCars().first.tipoCombustible, Combustible.gas);
      expect(facade.getCars().first.autonomia, capacidad * gastoKm);
      expect(facade.getCars().first.tiempoRecarga, 0);
      expect(facade.getCars().first.costeRecarga, capacidad * 1.2);
    });

    test('Hybrid vehicle creation test', () async {
      carData['tipoCombustible'] = 'Hibrido';
      await facade.buildCar(carData);
      expect(facade.getCars().last.tipoCombustible, Combustible.hib);
      expect(facade.getCars().last.autonomia, (capacidad * gastoKm) * 1.1);
      expect(facade.getCars().last.tiempoRecarga, 33.33333333333333);
      expect(facade.getCars().last.costeRecarga, capacidad * 1.2);
    });

    test('Electric vehicle creation test', () async {
      carData['tipoCombustible'] = 'Electrico';
      await facade.buildCar(carData);
      expect(facade.getCars().last.tipoCombustible, Combustible.elec);
      expect(facade.getCars().last.autonomia, capacidad * gastoKm);
      expect(facade.getCars().last.tiempoRecarga, 33.33333333333333);
      expect(facade.getCars().last.costeRecarga, capacidad * 0.1);
    });

    test('Wrong fuel type test', () async {
      carData['tipoCombustible'] = 'Wrong';
      expect(() async => await facade.buildCar(carData), throwsException);
    });

    test('Incorrect capacity value', () async {
      carData['capacidad'] = -1;
      expect(() async => await facade.buildCar(carData), throwsException);
    });

    test('Incorrect consumption value', () async {
      carData['gastoKm'] = -1;
      expect(() async => await facade.buildCar(carData), throwsException);
    });
  });
}
