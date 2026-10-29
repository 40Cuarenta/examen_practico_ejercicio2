import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/consumo_viewmodel.dart';
import 'vistas/pantallas/inicio_pantalla.dart';
import 'vistas/pantallas/consumo_pantalla.dart';
import 'vistas/pantallas/resultado_pantalla.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConsumoViewModel(),
      child: const MiApp(),
    ),
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consumo de Agua',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3375B1),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioPantalla(),
        '/consumo': (context) => const ConsumoPantalla(),
        '/resultado': (context) => const ResultadoPantalla(),
      },
    );
  }
}
