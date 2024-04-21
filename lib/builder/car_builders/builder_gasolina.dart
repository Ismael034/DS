import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/builder/builder.dart';

class BuilderGasolina implements CarBuilder {
  final Coche _coche = Coche();

  @override
  Coche getResultado() {
    return _coche;
  }

  @override
  void addTipoCombustible() {
    _coche.tipoCombustible = Combustible.gas;
  }

  @override
  void addAutonomia(capacidad, gastoKm) {
    _coche.autonomia =
        capacidad * gastoKm; // Capacidad en litros por el gasto en km del coche
  }

  @override
  void addTiempoRecarga(capacidad) {
    throw UnimplementedError(
        "No se puede añadir tiempo de recarga a un coche de gasolina");
  }

  @override
  void addCosteRecarga(capacidad) {
    _coche.costeRecarga = capacidad * 1.2; // 1.2 euros por litro
  }

  @override
  void addModelo(String modelo) {
    _coche.modelo = modelo;
  }
}
