import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
// Asegúrate de que esta ruta apunta a tu main.dart correctamente

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construye el widget y desencadena un fotograma.
    await tester.pumpWidget(MyApp());

    // Verifica que el contador comienza en 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Presiona el botón "+" y vuelve a construir el widget.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que el contador se haya incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
