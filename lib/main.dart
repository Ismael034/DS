import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/builder/car_builders/builder_electrico.dart';
import 'package:concesionario_tunning/builder/car_builders/builder_gasolina.dart';
import 'package:concesionario_tunning/builder/car_builders/builder_hibrido.dart';
import 'package:concesionario_tunning/car_dialog.dart';
import 'package:concesionario_tunning/item/car_item.dart';
import 'package:concesionario_tunning/strategy/context.dart';
import 'package:concesionario_tunning/builder/director.dart';
import 'package:concesionario_tunning/strategy/strategies/estrategia_confort.dart';
import 'package:concesionario_tunning/strategy/strategies/estrategia_deportivo.dart';
import 'package:concesionario_tunning/strategy/strategies/estrategia_familiar.dart';
import 'package:concesionario_tunning/item/item_list.dart';
import 'package:flutter/material.dart';

import 'builder/builder.dart';
import 'car_strategy.dart';

void main() {
  runApp(const Concesionario());
}

class Concesionario extends StatelessWidget {
  const Concesionario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concesionario Tunning',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '¡Bienvenido al Concesionario Tunning!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CarBuilder _builder;
  late Director _director;
  late Context _context;
  late Coche _coche;
  final List<ListItem> _cars = List<ListItem>.empty(growable: true);

  Widget _buildCars(List<ListItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Stack(
          children: [
            Card(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              elevation: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ListTile(
                      title: item.buildCar(context), // First part
                      subtitle: item.buildType(context), // Second part
                    ),
                  ),
                  Flexible(
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, bottom: 10.0),
                          child: FilterChip(
                            label: Text(
                                'Autonomía: ${item.getCoche().autonomia.toStringAsFixed(2)} km'),
                            onSelected: (bool value) {},
                            selected: true,
                            showCheckmark: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, bottom: 10.0),
                          child: FilterChip(
                            label: Text(
                                'Tiempo de recarga: ${item.getCoche().tiempoRecarga.toStringAsFixed(2)} horas'),
                            onSelected: (bool value) {},
                            selected: true,
                            showCheckmark: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, bottom: 10.0),
                          child: FilterChip(
                            label: Text(
                                'Coste de recarga: ${item.getCoche().costeRecarga.toStringAsFixed(2)} €'),
                            onSelected: (bool value) {},
                            selected: true,
                            showCheckmark: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, bottom: 10.0),
                          child: FilterChip(
                            label: Text(
                                'Modificado: ${item.getCoche().modificado ? 'Sí' : 'No'}'),
                            onSelected: (bool value) {},
                            selected: true,
                            showCheckmark: false,
                            color: item.getCoche().modificado
                                ? MaterialStateProperty.all<Color>(
                                    Colors.redAccent)
                                : MaterialStateProperty.all<Color>(
                                    Colors.lightGreen),
                          ),
                        ),
                        // Add more chips as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: IconButton(
                icon: const Icon(
                    Icons.mode_edit_outlined), // Replace with your desired icon
                onPressed: () async {
                  if (item.getCoche().modificado) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Error: El coche ya ha sido modificado"),
                    ));
                    return;
                  }
                  dynamic result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CarStrategy(); // Using the imported dialog widget
                    },
                  );
                  if (result != null && result is int) {
                    setState(() {
                      switch (result) {
                        case 0:
                          _context = Context(EstrategiaDeportivo());
                          _context.ejecutarEstrategia(item.getCoche());
                          break;
                        case 1:
                          _context = Context(EstrategiaFamiliar());
                          _context.ejecutarEstrategia(item.getCoche());
                          break;
                        case 2:
                          _context = Context(EstrategiaConfort());
                          _context.ejecutarEstrategia(item.getCoche());
                          break;
                      }
                    });
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget emptyList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/empty_list.png', width: 300, height: 300),
          const Text("No hay coches", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _cars.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: _buildCars(_cars),
                  ),
                ],
              )
            : emptyList(), // Showing empty list if no cars
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CarDialog(); // Using the imported dialog widget
            },
          );
          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              switch (result['tipoCombustible']) {
                case 'Gasolina':
                  _builder = BuilderGasolina();
                  break;
                case 'Hibrido':
                  _builder = BuilderHibrido();
                  break;
                case 'Electrico':
                  _builder = BuilderElectrico();
                  break;
              }
              _director = Director(_builder);
              _director.construir(
                  result['modelo'], result['capacidad'], result['gastoKm']);
              _coche = _builder.getResultado();
              _cars.add(CarItem(_coche));
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
