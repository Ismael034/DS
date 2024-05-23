import 'package:flutter_test/flutter_test.dart';
import 'package:concesionario_tunning/car_facade.dart';

void main() {
  group('CarManager', () {
    late CarFacade facade;
    late dynamic carData;

    setUp(() async {
      facade = CarFacade();
      carData = {
        'modelo': 'Modelo',
        'tipoCombustible': '',
        'capacidad': 100.0,
        'gastoKm': 10.0,
      };
      carData['tipoCombustible'] = 'Gasolina';
      await facade.buildCar(carData);
      carData['modelo'] = 'Modelo2';
      await facade.buildCar(carData);
    });

    test('Car modification test', () async {
      final car = facade.getCars().first;
      final autonomy = car.autonomia;
      final rechargeCost = car.costeRecarga;

      await facade.modifyCar(0, 0);

      final modifiedCar = facade.getCars().first;
      expect(modifiedCar.modelo.contains(" Sport"), true);
      expect(modifiedCar.autonomia, autonomy * 0.8);
      expect(modifiedCar.costeRecarga, rechargeCost + 10);
      expect(modifiedCar.modificado, true);
    });

    test('Car double modification test', () async {
      await facade.modifyCar(0, 0);
      expect(() async => await facade.modifyCar(0, 0), throwsException);
    });

    test('Car deletion test', () async {
      await facade.deleteCar(0);
      expect(facade.getCars().length, 1);
    });

    test('Unexpected car deletion test', () async {
      expect(() async => await facade.deleteCar(2), throwsException);
    });

    test('Car filtering test', () async {
      final filteredCars = facade.filterCars('Modelo2');
      expect(filteredCars.length, 1);
      expect(filteredCars.first.modelo, 'Modelo2');
    });

    test('Car sorting test', () async {
      facade.sortCars(false);
      expect(facade.getCars().first.modelo, 'Modelo2');
      facade.sortCars(true);
      expect(facade.getCars().first.modelo, 'Modelo');
    });
  });
}
