import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/strategy/estrategia.dart';

class EstrategiaDeportivo implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Sport";
    coche.autonomia *= 0.8;
    coche.costeRecarga += 10;
    coche.modificado = true;
  }
}
