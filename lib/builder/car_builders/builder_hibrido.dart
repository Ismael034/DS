import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/builder/builder.dart';

class BuilderHibrido implements CarBuilder {
  final Coche _coche = Coche();

  @override
  Coche getResultado() {
    return _coche;
  }

  @override
  void addTipoCombustible() {
    _coche.tipoCombustible = Combustible.hib;
  }

  @override
  void addAutonomia(capacidad, gastoKm) {
    // Capacidad en litros por gasto en km del coche + 10% de recarga bateria
    _coche.autonomia =
        (capacidad * gastoKm) + ((10 * (capacidad * gastoKm)) / 100);
  }

  @override
  void addTiempoRecarga(capacidad) {
    _coche.tiempoRecarga = (capacidad / 3); // 3 kw por hora de recarga
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
