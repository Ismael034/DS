import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/strategy/estrategia.dart';

class Context {
  final Estrategia _estrategia;

  Context(this._estrategia);

  void modifyCar(Coche coche) {
    _estrategia.modificar(coche);
  }
}
