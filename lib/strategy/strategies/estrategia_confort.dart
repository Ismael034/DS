import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/strategy/estrategia.dart';

class EstrategiaConfort implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Confort";
    coche.autonomia *= 1.2;
    coche.costeRecarga += 0;
    coche.modificado = true;
  }
}
