import 'package:flutter_test/flutter_test.dart';
import 'package:concesionario_tunning/car_facade.dart';

void main() {
  group('CarManager', () {
    late CarFacade facade;
    late dynamic carData;

    setUp(() {
      facade = CarFacade();
      carData = {
        'modelo': 'Modelo',
        'tipoCombustible': '',
        'capacidad': 100.0,
        'gastoKm': 10.0,
      };
      carData['tipoCombustible'] = 'Gasolina';
      facade.buildCar(carData);
      carData['modelo'] = 'Modelo2';
      facade.buildCar(carData);
    });

    test('Car modification test', () {
      final car = facade.getCars().first;
      final autonomy = car.autonomia;
      final rechargeCost = car.costeRecarga;

      facade.modifyCar(0, 0);

      expect(facade.getCars().first.autonomia, autonomy * 0.8);
      expect(facade.getCars().first.tiempoRecarga, 0);
      expect(facade.getCars().first.costeRecarga, rechargeCost + 10);
    });

    test('Car double modification test', () {
      facade.modifyCar(0, 0);
      expect(() => facade.modifyCar(0, 0), throwsException);
    });

    test('Car deletion test', () {
      facade.deleteCar(0);
      expect(facade.getCars().length, 1);
    });

    test('Unexpected car deletion test', () {
      facade.deleteCar(0);
      expect(() => facade.deleteCar(1), throwsException);
    });

    test('Car sorting test', () {
      facade.sortCars(false);
      expect(facade.getCars().first.modelo, 'Modelo2');
      facade.sortCars(true);
      expect(facade.getCars().first.modelo, 'Modelo');
    });

    test('Car filtering test', () {
      final filteredCars = facade.filterCars('Modelo2');
      expect(filteredCars.length, 1);
      expect(filteredCars.first.modelo, 'Modelo2');
    });
  });
}
