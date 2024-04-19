import 'package:flutter/material.dart';

class CarStrategy extends StatefulWidget {
  const CarStrategy({super.key});

  @override
  _CarStrategy createState() => _CarStrategy();
}

class ItemSelector {
  List<String> items = ['Deportivo', 'Familiar', 'Confort'];
  String selectedItem = '';

  void selectItem(int index) {
    if (index >= 0 && index < items.length) {
      selectedItem = items[index];
    } else {
      selectedItem = 'Invalid index!';
    }
  }
}

class _CarStrategy extends State<CarStrategy> {
  final ItemSelector selector = ItemSelector();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Selecciona un modelo'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: const Text('Deportivo'),
              leading: Radio(
                value: 0,
                groupValue: selector.selectedItem,
                onChanged: (value) {
                  Navigator.pop(context, value);
                }
              ),
            ),
            ListTile(
              title: const Text('Familiar'),
              leading: Radio(
                value: 1,
                groupValue: selector.selectedItem,
                onChanged: (value) {
                  Navigator.pop(context, value);
                }
              ),
            ),
            ListTile(
              title: const Text('Confort'),
              leading: Radio(
                value: 2,
                groupValue: selector.selectedItem,
                onChanged: (value) {
                  Navigator.pop(context, value);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

}
