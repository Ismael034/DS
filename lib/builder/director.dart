import 'builder.dart';
import 'package:concesionario_tunning/builder/car_builders/builder_electrico.dart';
import 'package:concesionario_tunning/builder/car_builders/builder_hibrido.dart';

class Director {
  final CarBuilder _builder;

  Director(this._builder);

  void construir(String modelo, double capacidad, double gastoKm) {
    _builder.addModelo(modelo);
    _builder.addTipoCombustible();
    _builder.addAutonomia(capacidad, gastoKm);
    _builder.addCosteRecarga(capacidad);

    if (_builder is BuilderElectrico || _builder is BuilderHibrido) {
      _builder.addTiempoRecarga(capacidad);
    }
  }
}
