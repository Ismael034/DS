import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/item/item_list.dart';
import 'package:flutter/material.dart';

class CarItem implements ListItem {
  final Coche car;

  CarItem(this.car);

  @override
  Widget buildCar(BuildContext context) {
    return Text(
      car.modelo,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: TextAlign.left,
    );
  }

  @override
  Widget buildType(BuildContext context) {
    switch (car.tipoCombustible) {
      case Combustible.gas:
        return Text(
          'Gasolina',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.left,
        );
      case Combustible.elec:
        return Text(
          'Eléctrico',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.left,
        );
      case Combustible.hib:
        return Text(
          'Híbrido',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.left,
        );
    }
  }

  @override
  Coche getCar() {
    return car;
  }
}
