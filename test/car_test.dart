import 'package:flutter_test/flutter_test.dart';
import 'package:concesionario_tunning/car_facade.dart';
import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/tools/car_data_service.dart';

void main() {
  group('CarFacade', () {
    final facade = CarFacade();
    const capacidad = 100.0;
    const gastoKm = 10.0;

    final carData = {
      'modelo': 'Modelo',
      'tipoCombustible': '',
      'capacidad': 100.0,
      'gastoKm': 10.0,
    };
    test('Gasoline vehicle creation test', () {
      carData['tipoCombustible'] = 'Gasolina';
      facade.buildCar(carData);
      expect(facade.getCars().first.tipoCombustible, Combustible.gas);
      expect(facade.getCars().first.autonomia, capacidad * gastoKm);
      expect(facade.getCars().first.tiempoRecarga, 0);
      expect(facade.getCars().first.costeRecarga, capacidad * 1.2);
    });

    test('Hybrid vehicle creation test', () {
      carData['tipoCombustible'] = 'Hibrido';
      facade.buildCar(carData);
      expect(facade.getCars().last.tipoCombustible, Combustible.hib);
      expect(facade.getCars().last.autonomia, (capacidad * gastoKm) * 1.1);
      expect(facade.getCars().last.tiempoRecarga, capacidad / 3);
      expect(facade.getCars().last.costeRecarga, capacidad * 1.2);
    });

    test('Electric vehicle creation test', () {
      carData['tipoCombustible'] = 'Electrico';
      facade.buildCar(carData);
      expect(facade.getCars().last.tipoCombustible, Combustible.elec);
      expect(facade.getCars().last.autonomia, capacidad * gastoKm);
      expect(facade.getCars().last.tiempoRecarga, capacidad / 3);
      expect(facade.getCars().last.costeRecarga, gastoKm);
    });

    test('Wrong fuel type test', () {
      carData['tipoCombustible'] = 'Wrong';
      expect(() => facade.buildCar(carData), throwsException);
    });

    test('Incorrect capacity value', () {
      carData['capacidad'] = -1;
      expect(() => facade.buildCar(carData), throwsException);
    });

    test('Incorrect consumption value', () {
      carData['gastoKm'] = -1;
      expect(() => facade.buildCar(carData), throwsException);
    });
  });
}
