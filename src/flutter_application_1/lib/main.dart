import 'package:flutter/material.dart';
import 'home_page.dart'; // Importar la página principal desde otro archivo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🌊OpenDike Demo🌊',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 175, 196)),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'OpenDike Demo🌊'),
    );
  }
}
