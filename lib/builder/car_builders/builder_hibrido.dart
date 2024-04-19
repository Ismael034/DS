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
    _coche.autonomia = (capacidad * gastoKm) + ((10*(capacidad * gastoKm))/100); // Capacidad en litros por el gasto en km del coche + 10% de recarga a la bateria
  }

  @override
  void addTiempoRecarga(capacidad) {
    _coche.tiempoRecarga = (capacidad / 3); // 3 kw por hora de recarga
  }

  @override
  void addCosteRecarga(capacidad) {
    _coche.costeRecarga = capacidad * 0.1; // 0.1€ por kWh
  }

  @override
  void addModelo(String modelo) {
    _coche.modelo = modelo;
  }
}