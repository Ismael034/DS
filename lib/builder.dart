import 'coche.dart';

//Clase Builder y sus implementaciones

abstract class CarBuilder {
  final Coche _coche = Coche();

  Coche getResultado() {
    return _coche;
  }

  void addTipoCombustible();
  void addAutonomia();
  void addTiempoRecarga();
  void addCosteRecarga();
  void addModelo();
}

//variables y metodos implementados en clases abstractas se tienen que sobreescribir en las clases que heredan de ellas
//En este caso, se deben de sobreescribir el atributo _miCoche y el metodo getResultado aunque se definan en la clase abstracta
//Se pueden no declarar en las clases hijas, pero de esta manera se asegura que se declaren

class BuilderElectrico implements CarBuilder {
  @override
  final Coche _coche = Coche();

  @override
  Coche getResultado() {
    return _coche;
  }

  @override
  void addTipoCombustible() {
    _coche.tipoCombustible = "Electrico";
  }

  @override
  void addAutonomia() {
    _coche.autonomia = 500;
  }

  @override
  void addTiempoRecarga() {
    _coche.tiempoRecarga = 4;
  }

  @override
  void addCosteRecarga() {
    _coche.costeRecarga = 20;
  }

  @override
  void addModelo() {
    _coche.modelo = "Tesla";
  }
}

class BuilderGasolina implements CarBuilder {
  @override
  final Coche _coche = Coche();

  @override
  Coche getResultado() {
    return _coche;
  }

  @override
  void addTipoCombustible() {
    _coche.tipoCombustible = "Gasolina";
  }

  @override
  void addAutonomia() {
    _coche.autonomia = 1000;
  }

  @override
  void addTiempoRecarga() {
    throw UnimplementedError(
        "No se puede añadir tiempo de recarga a un coche de gasolina");
  }

  @override
  void addCosteRecarga() {
    throw UnimplementedError(
        "No se puede añadir coste de recarga a un coche de gasolina");
  }

  @override
  void addModelo() {
    _coche.modelo = "Audi A6";
  }
}

class BuilderHibrido implements CarBuilder {
  @override
  final Coche _coche = Coche();

  @override
  Coche getResultado() {
    return _coche;
  }

  @override
  void addTipoCombustible() {
    _coche.tipoCombustible = "Hibrido";
  }

  @override
  void addAutonomia() {
    _coche.autonomia = 800;
  }

  @override
  void addTiempoRecarga() {
    _coche.tiempoRecarga = 2;
  }

  @override
  void addCosteRecarga() {
    _coche.costeRecarga = 10;
  }

  @override
  void addModelo() {
    _coche.modelo = "Prius";
  }
}
