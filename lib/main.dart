import 'package:concesionario_tunning/coche.dart';
import 'package:concesionario_tunning/context.dart';
import 'package:concesionario_tunning/director.dart';
import 'package:concesionario_tunning/estrategia.dart';
import 'package:flutter/material.dart';

import 'builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concesionario Tunning',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
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
  int _step = 0;
  late CarBuilder _builder;
  late Director _director;
  late Context _context;
  late Coche _coche;
  bool _modificado = false;

  void _changeStep(int step) {
    setState(() {
      _step = step;
    });
  }

  String _getCarPhoto() {
    switch (_coche.tipoCombustible) {
      case "Gasolina":
        if (_coche.modelo == "Audi A6 Sport") {
          return 'assets/audi_sport.jpg';
        } else if (_coche.modelo == "Audi A6 Familiar") {
          return 'assets/audi_familiar.jpg';
        } else if (_coche.modelo == "Audi A6 Comfort") {
          return 'assets/audi_comfort.jpg';
        } else {
          return 'assets/audi.jpg';
        }
      case "Hibrido":
        if (_coche.modelo == "Prius Sport") {
          return 'assets/prius_sport.jpg';
        } else if (_coche.modelo == "Prius Familiar") {
          return 'assets/prius_familiar.jpg';
        } else if (_coche.modelo == "Prius Comfort") {
          return 'assets/prius_comfort.jpg';
        } else {
          return 'assets/prius.jpg';
        }
      case "Electrico":
        if (_coche.modelo == "Tesla Sport") {
          return 'assets/tesla_sport.jpg';
        } else if (_coche.modelo == "Tesla Familiar") {
          return 'assets/tesla_familiar.jpg';
        } else if (_coche.modelo == "Tesla Comfort") {
          return 'assets/tesla_comfort.jpg';
        } else {
          return 'assets/tesla.jpg';
        }
      default:
        return "";
    }
  }

  Widget _buildStep() {
    switch (_step) {
      case 0:
        _modificado = false;
        return _getBuilderWidget();
      case 1:
        return _getCarDisplayWidget();
      case 2:
        return _getEstrategiaWidget();
      default:
        _step = 0;
        _modificado = false;
        return _getBuilderWidget();
    }
  }

  Widget _getBuilderWidget() {
    return Column(children: [
      const Text(
        "Selecciona el tipo de coche que deseas:",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: [
            Image.asset('assets/audi.jpg', width: 300, height: 300),
            ElevatedButton(
              onPressed: () {
                _builder = BuilderGasolina();
                _director = Director(_builder);
                _director.construir();
                _coche = _builder.getResultado();
                _changeStep(1);
              },
              child: const Text('Gasolina'),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/prius.jpg', width: 300, height: 300),
            ElevatedButton(
              onPressed: () {
                _builder = BuilderHibrido();
                _director = Director(_builder);
                _director.construir();
                _coche = _builder.getResultado();
                _changeStep(1);
              },
              child: const Text('Hibrido'),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/tesla.jpg', width: 300, height: 300),
            ElevatedButton(
              onPressed: () {
                _builder = BuilderElectrico();
                _director = Director(_builder);
                _director.construir();
                _coche = _builder.getResultado();
                _changeStep(1);
              },
              child: const Text('Electrico'),
            ),
          ],
        ),
      ]),
    ]);
  }

  Widget _getCarDisplayWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () => _changeStep(0),
              child: const Text('He cambiado de opinión'),
            ),
            const SizedBox(height: 100), //Widget para crear espacios
            Text(
              _coche.getDescripcion(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                //Si no esta modificado mostrar siguiente paso, si no mostrar error
                if (!_modificado) {
                  _changeStep(2);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: const Text("El coche ya ha sido modificado"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cerrar"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Modificar Coche'),
            ),
            Image.asset(_getCarPhoto(), width: 300, height: 300),
          ],
        ),
      ],
    );
  }

  Widget _getEstrategiaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _context = Context(EstrategiaDeportivo());
                _context.ejecutarEstrategia(_coche);
                _modificado = true;
                _changeStep(1);
              },
              child: const Text('Hacerlo Deportivo'),
            ),
            const SizedBox(height: 8),
            const Text(
              "Deportivo: \n- Caballaje x3\n- maletero: 200L",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _context = Context(EstrategiaFamiliar());
                _context.ejecutarEstrategia(_coche);
                _modificado = true;
                _changeStep(1);
              },
              child: const Text('Hacerlo Familiar'),
            ),
            const SizedBox(height: 8),
            const Text(
              "Familiar: \n- Maletero: 500L\n",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _context = Context(EstrategiaComfort());
                _context.ejecutarEstrategia(_coche);
                _modificado = true;
                _changeStep(1);
              },
              child: const Text('Mejorar Comfort'),
            ),
            const SizedBox(height: 8),
            const Text(
              "Comfort: \n- Caballaje x2\n- Maletero: 400L",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildStep(),
          ],
        ),
      ),
    );
  }
}
