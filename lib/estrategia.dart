import 'coche.dart';

abstract class Estrategia {
  void modificar(Coche coche);
}

class EstrategiaDeportivo implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Sport";
    coche.caballaje *= 3;
    coche.espacioMaletero = 200;
  }
}

class EstrategiaFamiliar implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Familiar";
    coche.espacioMaletero = 500;
  }
}

class EstrategiaComfort implements Estrategia {
  @override
  void modificar(Coche coche) {
    coche.modelo += " Comfort";
    coche.caballaje *= 2;
    coche.espacioMaletero = 400;
  }
}
