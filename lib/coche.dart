//Clase coche
//Los atributos late es que se declaran mas tarde
class Coche {
  late String modelo;
  late String tipoCombustible;
  late double autonomia;
  double tiempoRecarga = 0;
  double costeRecarga = 0;
  double caballaje = 150;
  double espacioMaletero = 300;

  String getDescripcion() {
    return "Modelo: $modelo\nTipo de combustible: $tipoCombustible\nAutonomía: $autonomia km\nTiempo de recarga: $tiempoRecarga h\nCoste de recarga: $costeRecarga €\nCaballaje: $caballaje CV\nEspacio del maletero: $espacioMaletero L";
  }
}
