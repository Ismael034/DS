import '../builder/coche.dart';

abstract class Estrategia {
  void modificar(Coche coche);
}

class EstrategiaDeportivo implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Sport";
    coche.autonomia *= 0.8;
    coche.costeRecarga += 10;
    coche.modificado = true;
  }
}

class EstrategiaFamiliar implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Familiar";
    coche.autonomia *= 1.5;
    coche.costeRecarga *= 0.5;
    coche.modificado = true;
  }
}

class EstrategiaComfort implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Comfort";
    coche.autonomia *= 1.2;
    coche.costeRecarga += 0;
    coche.modificado = true;
  }
}
