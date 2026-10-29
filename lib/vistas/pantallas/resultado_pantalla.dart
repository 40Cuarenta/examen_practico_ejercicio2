import 'package:flutter/material.dart';
import '../../modelos/consumo_modelo.dart';
import '../widgets/fondo_degradado.dart';
import '../widgets/glass_card.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final consumo =
        ModalRoute.of(context)!.settings.arguments as ConsumoModelo;

    Widget dato(String titulo, String valor, [bool destacado = false]) {
      return ListTile(
        title: Text(
          titulo,
          style: TextStyle(
            color: const Color(0xFF03045A),
            fontWeight: destacado ? FontWeight.bold : FontWeight.normal,
            fontSize: destacado ? 18 : 15,
          ),
        ),
        trailing: Text(
          valor,
          style: TextStyle(
            color: const Color(0xFF03045A),
            fontWeight: destacado ? FontWeight.bold : FontWeight.w600,
            fontSize: destacado ? 18 : 15,
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF03045A),
        ),
        title: const Text(
          'Resultado',
          style: TextStyle(
            color: Color(0xFF03045A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FondoDegradado(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              GlassCard(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  children: [
                    dato('Lectura anterior', '${consumo.lecturaAnterior}'),
                    dato('Lectura actual', '${consumo.lecturaActual}'),
                    dato('Consumo', '${consumo.consumo} m³'),
                    dato(
                      'Tarifa aplicada',
                      '\$${consumo.tarifa.toStringAsFixed(2)} por m³',
                    ),
                    const Divider(color: Color(0x3303045A)),
                    dato(
                      'Total a pagar',
                      '\$${consumo.total.toStringAsFixed(2)}',
                      true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3375B1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Regresar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
