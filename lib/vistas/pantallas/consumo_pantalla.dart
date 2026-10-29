import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/consumo_viewmodel.dart';
import '../widgets/campo_numero.dart';
import '../widgets/fondo_degradado.dart';
import '../widgets/glass_card.dart';

class ConsumoPantalla extends StatefulWidget {
  const ConsumoPantalla({super.key});

  @override
  State<ConsumoPantalla> createState() => _ConsumoPantallaState();
}

class _ConsumoPantallaState extends State<ConsumoPantalla> {
  final anteriorController = TextEditingController();
  final actualController = TextEditingController();

  void calcular() {
    int anterior = int.tryParse(anteriorController.text) ?? 0;
    int actual = int.tryParse(actualController.text) ?? 0;

    final vm = context.read<ConsumoViewModel>();
    final resultado = vm.calcular(anterior, actual);

    if (resultado != null) {
      Navigator.pushNamed(
        context,
        '/resultado',
        arguments: resultado,
      );
    }
  }

  @override
  void dispose() {
    anteriorController.dispose();
    actualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ConsumoViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF03045A),
        ),
        title: const Text(
          'Lecturas del medidor',
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
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CampoNumero(
                      etiqueta: 'Lectura anterior',
                      controller: anteriorController,
                    ),
                    const SizedBox(height: 16),
                    CampoNumero(
                      etiqueta: 'Lectura actual',
                      controller: actualController,
                    ),
                    if (vm.error != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        vm.error!,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: calcular,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3375B1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Calcular',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
