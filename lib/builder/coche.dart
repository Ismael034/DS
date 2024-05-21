//Clase coche
//Los atributos late es que se declaran mas tarde
enum Combustible { gas, hib, elec }

class Coche {
  late String modelo;
  late Combustible tipoCombustible;
  late double autonomia;
  double tiempoRecarga = 0;
  double costeRecarga = 0;
  bool modificado = false;
  late double userId = 0;

  String getDescripcion() {
    return "Modelo: $modelo\nTipo de combustible: $tipoCombustible\n"
        "Autonomía: $autonomia km\nTiempo de recarga: $tiempoRecarga h\n"
        "Coste de recarga: $costeRecarga €\n";
  }
}
