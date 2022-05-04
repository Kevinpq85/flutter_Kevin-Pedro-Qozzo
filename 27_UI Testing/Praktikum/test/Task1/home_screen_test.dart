import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:s_27/Task1/home_screen.dart';

void main() {
  testWidgets('judul halaman harus home screen ...',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
          title: const Text('home screen'),
        )),
      ),
    ));
    expect(find.text('home screen'), findsOneWidget);
  });
  testWidgets('Icon untuk menambah kontak', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
      )),
    ));
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
  testWidgets('Melakukan test pada semua elemen', (WidgetTester tester) async {
    tester.allElements;
  });
}
