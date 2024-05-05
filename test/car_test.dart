import 'package:flutter_test/flutter_test.dart';
import 'package:concesionario_tunning/car_facade.dart';
import 'package:concesionario_tunning/builder/coche.dart';

void main() {
  group('CarFacade', () {
    final facade = CarFacade();
    final carData = {
      'modelo': 'Modelo',
      'tipoCombustible': '',
      'capacidad': 100.0,
      'gastoKm': 10.0,
    };
    test('Gasoline vehicle creation test', () {
      carData['tipoCombustible'] = 'Gasolina';
      facade.buildCar(carData);
      expect(facade.getCars().length, 1);
      expect(facade.getCars().first.modelo, 'Modelo');
      expect(facade.getCars().first.tipoCombustible, Combustible.gas);
      expect(facade.getCars().first.autonomia, 1000);
      expect(facade.getCars().first.tiempoRecarga, 0);
      expect(facade.getCars().first.costeRecarga, 120);
    });

    test('Hybrid vehicle creation test', () {
      carData['tipoCombustible'] = 'Hibrido';
      facade.buildCar(carData);
      expect(facade.getCars().length, 2);
      expect(facade.getCars().last.modelo, 'Modelo');
      expect(facade.getCars().last.tipoCombustible, Combustible.hib);
      expect(facade.getCars().last.autonomia, 1100);
      expect(facade.getCars().last.tiempoRecarga, 33.333333333333336);
      expect(facade.getCars().last.costeRecarga, 120);
    });

    test('Electric vehicle creation test', () {
      carData['tipoCombustible'] = 'Electrico';
      facade.buildCar(carData);
      expect(facade.getCars().length, 3);
      expect(facade.getCars().last.modelo, 'Modelo');
      expect(facade.getCars().last.tipoCombustible, Combustible.elec);
      expect(facade.getCars().last.autonomia, 1000);
      expect(facade.getCars().last.tiempoRecarga, 33.333333333333336);
      expect(facade.getCars().last.costeRecarga, 10);
    });
  });
}
