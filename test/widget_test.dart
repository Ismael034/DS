// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:concesionario_tunning/main.dart';

void main() {
  testWidgets('Vehicle creation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Concesionario());

    // Verify that the title is displayed.
    expect(find.text('Concesionario Tunning'), findsOneWidget);

    // Tap the 'Add vehicle' button and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the vehicle creation dialog is displayed.
    expect(find.text('Compra tu coche'), findsOneWidget);

    // Tap the 'Cancel' button and trigger a frame.
    await tester.tap(find.text('Cancelar'));
    await tester.pump();

    // Verify that the vehicle creation dialog is closed.
    expect(find.text('Compra tu coche'), findsNothing);
  });
}
