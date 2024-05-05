import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/car_dialog.dart';
import 'package:concesionario_tunning/item/car_item.dart';
import 'package:flutter/material.dart';
import 'package:concesionario_tunning/car_facade.dart';
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
      home: const MyHomePage(title: 'Concesionario Tunning'),
      debugShowCheckedModeBanner: false,
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
  final CarFacade _carFacade = CarFacade();
  bool sortAsc = true;

  Widget _buildCars(List<Coche> items) {
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
                      title: CarItem(item).buildCar(context),
                      subtitle: CarItem(item).buildType(context),
                      leading: const Icon(Icons.car_rental),
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
                                'Autonomía: ${item.autonomia.toStringAsFixed(2)} km'),
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
                                'Tiempo de recarga: ${item.tiempoRecarga.toStringAsFixed(2)} horas'),
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
                                'Coste de recarga: ${item.costeRecarga.toStringAsFixed(2)} €'),
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
                                'Modificado: ${item.modificado ? 'Sí' : 'No'}'),
                            onSelected: (bool value) {},
                            selected: true,
                            showCheckmark: false,
                            color: item.modificado
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
                  if (item.modificado) {
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
                      _carFacade.modifyCar(result, index);
                    });
                  }
                },
              ),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _carFacade.deleteCar(index);
                  });
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
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              setState(() {
                _carFacade.sortCars(sortAsc);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(sortAsc
                      ? 'Orden ascendente alfabéticamente'
                      : 'Orden descendente alfabéticamente'), // Show the sorting order
                ));
                sortAsc = !sortAsc;
              });
            },
          ),
          SearchAnchor(
            searchController: SearchController(),
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.openView();
                },
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              List<Coche> filteredCars = _carFacade.filterCars(controller.text);
              return List<Widget>.generate(
                filteredCars.length,
                (index) {
                  return ListTile(
                    title: Text(filteredCars[index].modelo),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        child: _carFacade.getCars().isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: _buildCars(_carFacade.getCars()),
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
              _carFacade.buildCar(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
