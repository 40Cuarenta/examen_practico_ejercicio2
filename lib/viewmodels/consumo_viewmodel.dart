import 'package:flutter/material.dart';
import '../modelos/consumo_modelo.dart';

class ConsumoViewModel extends ChangeNotifier {
  String? error;

  ConsumoModelo? calcular(int anterior, int actual) {
    if (actual < anterior) {
      error = 'La lectura actual no puede ser menor que la anterior';
      notifyListeners();
      return null;
    }

    error = null;
    int consumo = actual - anterior;
    double tarifa = 0.0;

    if (consumo <= 15) {
      tarifa = 0.40;
    } else if (consumo <= 30) {
      tarifa = 0.60;
    } else {
      tarifa = 0.80;
    }

    double total = consumo * tarifa;
    notifyListeners();

    return ConsumoModelo(
      lecturaAnterior: anterior,
      lecturaActual: actual,
      consumo: consumo,
      tarifa: tarifa,
      total: total,
    );
  }
}
