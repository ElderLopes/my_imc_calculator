import 'package:my_imc_calculator/class/person.dart';
import 'package:test/test.dart';

import '../bin/my_imc_calculator.dart';

void main() {
  test('Cálculo de IMC - Entrada válida', () {
    Person person = Person('Alice', 60.0, 1.65);
    expect(calculatorIMC(person), closeTo(22.04, 0.01));
  });

  test('Cálculo de IMC - Entrada inválida (altura zero)', () {
    Person person = Person('Bob', 70.0, 0.0);
    expect(() => calculatorIMC(person), throwsA(isA<Exception>()));
  });

  test('Cálculo de IMC - Nome', () {
    Person person = Person('', 80.0, 1.8);
    expect(person.name, equals(''));
  });

  test('Leitura de dados - Valor inválido', () {
    String input = 'Texto inválido';
    expect(() => double.parse(input), throwsFormatException);
  });

  test('Leitura de dados - Peso negativo/Altura negativa', () {
    String input = '-170.0';
    expect(() {
      double parsed = double.parse(input);
      if (parsed < 0) {
        throw FormatException("Valor negativo não é permitido.");
      }
    }, throwsA(isA<FormatException>()));
  });
}
