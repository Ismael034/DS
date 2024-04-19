import 'coche.dart';

//Clase Builder y sus implementaciones

abstract class CarBuilder {
  final Coche _coche = Coche();

  Coche getResultado() {
    return _coche;
  }

  void addTipoCombustible();
  void addAutonomia(double capacidad, double gastoKm);
  void addTiempoRecarga(double capacidad);
  void addCosteRecarga(double capacidad);
  void addModelo(String modelo);
}

//variables y metodos implementados en clases abstractas se tienen que sobreescribir en las clases que heredan de ellas
//En este caso, se deben de sobreescribir el atributo _miCoche y el metodo getResultado aunque se definan en la clase abstracta
//Se pueden no declarar en las clases hijas, pero de esta manera se asegura que se declaren






