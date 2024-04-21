import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/strategy/estrategia.dart';

class EstrategiaFamiliar implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Familiar";
    coche.autonomia *= 1.5;
    coche.costeRecarga *= 0.5;
    coche.modificado = true;
  }
}
