import 'package:concesionario_tunning/tools/car_data_service.dart';
import 'package:flutter/material.dart';
import 'package:concesionario_tunning/builder/coche.dart';

class CarDialog extends StatefulWidget {
  @override
  _CarDialog createState() => _CarDialog();
}

class _CarDialog extends State<CarDialog> {
  Combustible selectedCar = Combustible.gas; // default selected fuel type
  String? selectedModel; // selected car model
  List<String> availableModels = []; // List to hold available car models
  final _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _loadModels(selectedCar); // Load data when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Compra tu coche'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SegmentedButton<Combustible>(
                segments: const <ButtonSegment<Combustible>>[
                  ButtonSegment<Combustible>(
                      value: Combustible.gas,
                      label: Text('Gasolina'),
                      icon: Icon(Icons.local_gas_station_outlined)),
                  ButtonSegment<Combustible>(
                      value: Combustible.hib,
                      label: Text('Híbrido'),
                      icon: Icon(Icons.earbuds_battery)),
                  ButtonSegment<Combustible>(
                      value: Combustible.elec,
                      label: Text('Eléctrico'),
                      icon: Icon(Icons.battery_4_bar)),
                ],
                selected: <Combustible>{selectedCar},
                onSelectionChanged: (Set<Combustible> newSelection) {
                  setState(() {
                    selectedCar = newSelection.first;
                    _loadModels(selectedCar);
                    selectedModel = null;
                    _controller.clear();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSelector(),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            selectedModel == null ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Debes de seleccionar un modelo"),
            )) : Navigator.of(context).pop(CarDataService.getCarByModel(selectedModel!));
          },
          child: const Text('OK'),
        ),
      ],
    );
  }


  Widget _buildSelector() {
    return Container(
        margin: const EdgeInsets.only(top: 10), // Set top margin here
        child: DropdownMenu<String>(
          controller: _controller,
          hintText: ("Modelo"),
          expandedInsets: EdgeInsets.zero,
          onSelected: (String? newValue) {
            setState(() {
              selectedModel = newValue;
            });
          },
          dropdownMenuEntries: availableModels.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(
              label: value,
              value: value,
            );
          }).toList(),
        )
    );
  }
  Future<void> _loadModels(Combustible selectedType) async {
    List<String> models = await CarDataService.getAvailableModelsByCombustible(
        selectedType);
    setState(() {
      availableModels = models;
      selectedModel = null; // Reset selected model
    });
  }
}