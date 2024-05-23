import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concesionario_tunning/main.dart';

void main() {
  testWidgets('Vehicle creation test', (WidgetTester tester) async {
    // Construye la app y dispara un frame.
    await tester.pumpWidget(const Concesionario());

    // Verifica que el título es mostrado.
    expect(find.text('Concesionario Tunning'), findsOneWidget);

    // Toca el botón 'Añadir vehículo' y dispara un frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verifica que el diálogo de creación de vehículo es mostrado.
    expect(find.text('Compra tu coche'), findsOneWidget);

    // Toca el botón 'Cancelar' y dispara un frame.
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();

    // Verifica que el diálogo de creación de vehículo es cerrado.
    expect(find.text('Compra tu coche'), findsNothing);
  });
}
