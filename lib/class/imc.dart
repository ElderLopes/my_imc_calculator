class IMC {
  final double value;
  final DateTime date;
  late String category;

  IMC(this.value, this.date, this.category);

  IMC.withCategory(this.value, this.date) {
    category = _classificarIMC(value);
  }
}

String _classificarIMC(double imc) {
  if (imc < 16) {
    return "Magreza grave";
  } else if (imc >= 16 && imc < 17) {
    return "Magreza moderada";
  } else if (imc >= 17 && imc < 18.5) {
    return "Magreza leve";
  } else if (imc >= 18.5 && imc < 25) {
    return "Saudável";
  } else if (imc >= 25 && imc < 30) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    return "Obesidade nível I";
  } else if (imc >= 35 && imc < 40) {
    return "Obesidade nível II (severa)";
  } else {
    return "Obesidade nível III (mórbida)";
  }
}
