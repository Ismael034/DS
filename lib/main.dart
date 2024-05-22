//import 'dart:html';

import 'package:concesionario_tunning/api_client.dart';
import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/car_dialog.dart';
import 'package:concesionario_tunning/item/car_item.dart';
import 'package:flutter/material.dart';
import 'package:concesionario_tunning/car_facade.dart';
import 'car_strategy.dart';
import 'user/user.dart';

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
  final ApiClient _apiClient = ApiClient();
  bool sortAsc = true;
  List<User> users = [];
  List<Coche> allCoches = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
    /*users = _apiClient.getUsers();
    _carFacade.setUser(users[0]);*/
    /*_apiClient.getUsers().then((value) async {
      users = value;
      await _carFacade.setUser(users[0]);
    });*/
    /*fetchUsers().then((fetchedUsers) {
      setState(() {
        users = fetchedUsers;
        _carFacade.setUser(users[0]);
      });
    });*/
    /*fetchCoches().then((fetchedCoches) {
      setState(() {
        allCoches = fetchedCoches;
        filterCochesByUser(_carFacade.getUser());
      });
    });*/
  }

  Future<void> _initializeData() async {
    try {
      // Espera a que getUsers termine
      users = await _apiClient.getUsers();
      // Usa el primer usuario en la lista
      await _carFacade.setUser(users[0]);
      setState(() {
        allCoches = _carFacade.getCars();
      });
    } catch (e) {
      // Manejo de errores
      print('Error inicializando datos: $e');
    }
  }

  Future<void> _updateData() async {
    try {
      // Espera a que getCochesUsuario termine
      allCoches = await _apiClient.getCochesUsuario(_carFacade.getUser().id);
      setState(() {
        _carFacade.setCars(allCoches);
      });
    } catch (e) {
      // Manejo de errores
      print('Error actualizando datos: $e');
    }
  }

  /*Future<List<User>> fetchUsers() async {
    /*final response = await http.get(Uri.parse('http://localhost:3000/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }*/
    /*
    //Lista de usuarios locales
    List<User> users = [
      User(id: 1, name: 'Alice'),
      User(id: 2, name: 'Bob'),
      User(id: 3, name: 'Charlie'),
      User(id: 4, name: 'Diana'),
    ];

    return users;
    */
    return _apiClient.getUsers();
  }

  Future<List<Coche>> fetchCoches() async {
    /*
    await Future.delayed(Duration(seconds: 1));

    List<Coche> coches = [
      Coche(),
      Coche(),
    ];

    coches[0].userId = 2;
    coches[0].modelo = 'Cupra';
    coches[0].autonomia = 120;
    coches[0].tipoCombustible = Combustible.gas;
    coches[0].costeRecarga = 20;

    coches[1].userId = 1;
    coches[1].modelo = 'Toyota';
    coches[1].autonomia = 100;
    coches[1].tipoCombustible = Combustible.gas;
    coches[1].costeRecarga = 30;

    return coches;
    */
    return _apiClient.getCochesUsuario(_carFacade.getUser().id);
  }

  void filterCochesByUser(User user) {
    setState(() {
      _carFacade.setCars(
          allCoches.where((coche) => coche.userId == user.id).toList());
    });
  }*/

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
                icon: const Icon(Icons.mode_edit_outlined),
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
                      return const CarStrategy();
                    },
                  );
                  if (result != null && result is int) {
                    _carFacade.modifyCar(result, index);
                    _updateData();
                    /*
                    setState(() async {
                      await _carFacade.modifyCar(result, index);
                    });
                    */
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
                  _carFacade.deleteCar(index);
                  _updateData();
                  /*
                  setState(() async {
                    await _carFacade.deleteCar(index);
                  });*/
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
                      : 'Orden descendente alfabéticamente'),
                ));
                sortAsc = !sortAsc;
              });
            },
          ),
          DropdownButton<User>(
            value: _carFacade.getUser(),
            hint: Text("Seleccionar usuario"),
            onChanged: (User? newValue) {
              _carFacade.setUser(newValue);
              _updateData();
              /*setState(() {
                await _carFacade.setUser(newValue);
                /*
                _apiClient.getCochesUsuario(newValue!.id).then((value) {
                  allCoches = value;
                })*/
                /*
                if (_carFacade.getUser().id != -1) {
                  filterCochesByUser(_carFacade.getUser());
                } else {
                  _carFacade.setCars([]);
                }*/
              });*/
            },
            items: users.map<DropdownMenuItem<User>>((User user) {
              return DropdownMenuItem<User>(
                value: user,
                child: Text(user.name),
              );
            }).toList(),
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
            : emptyList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CarDialog();
            },
          );
          if (result != null && result is Map<String, dynamic>) {
            _carFacade.buildCar(result);
            _updateData();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
