import 'package:flutter/material.dart';

class CarStrategy extends StatefulWidget {
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
      title: Text('Selecciona un modelo'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: Text('Deportivo'),
              leading: new Radio(
                value: 0,
                groupValue: selector.selectedItem,
                onChanged: (value) {
                  Navigator.pop(context, value);
                }
              ),
            ),
            ListTile(
              title: Text('Familiar'),
              leading: new Radio(
                value: 1,
                groupValue: selector.selectedItem,
                onChanged: (value) {
                  Navigator.pop(context, value);
                }
              ),
            ),
            ListTile(
              title: Text('Confort'),
              leading: new Radio(
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

  void _showSelectedItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Item'),
          content: Text(selector.selectedItem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
