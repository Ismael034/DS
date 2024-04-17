import 'builder.dart';

class Director {
  final CarBuilder _builder;

  Director(this._builder);

  void construir() {
    _builder.addModelo();
    _builder.addTipoCombustible();
    _builder.addAutonomia();

    if (_builder is BuilderElectrico || _builder is BuilderHibrido) {
      _builder.addTiempoRecarga();
      _builder.addCosteRecarga();
    }
  }
}
