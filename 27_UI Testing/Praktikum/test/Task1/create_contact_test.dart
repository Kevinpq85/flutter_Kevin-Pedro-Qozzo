import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('judul halaman harus create contact',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('create new contact'),
        ),
      )),
    ));

    expect(find.text('create new contact'), findsOneWidget);
  });
  testWidgets('melakukan test pada semua elemen', (WidgetTester tester) async {
    tester.allElements;
  });
}
