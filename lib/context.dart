import 'package:concesionario_tunning/coche.dart';
import 'package:concesionario_tunning/estrategia.dart';

class Context {
  final Estrategia _estrategia;

  Context(this._estrategia);

  void ejecutarEstrategia(Coche coche) {
    _estrategia.modificar(coche);
  }
}
