import 'package:concesionario_tunning/builder/coche.dart';
import 'package:flutter/material.dart';

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildCar(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildType(BuildContext context);

  Coche getCoche();
}
