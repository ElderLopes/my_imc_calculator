import 'dart:io';

import 'package:my_imc_calculator/class/person.dart';

void main() {
  print("Calculadora de IMC");

  try {
    stdout.write("Digite o nome: ");
    String name = stdin.readLineSync()!;

    stdout.write("Digite o peso (em kg): ");
    double weight = double.parse(stdin.readLineSync()!);
    if (weight == 0.0) {
      throw Exception("Peso não pode ser zero.");
    }
    stdout.write("Digite a altura (em metros): ");
    double height = double.parse(stdin.readLineSync()!);
    if (height == 0.0) {
      throw Exception("Altura não pode ser zero.");
    }

    Person person = Person(name, weight, height);
    double imc = calculatorIMC(person);

    print("O IMC de ${person.name} é: $imc");
  } catch (e) {
    print("Valor inválido. Certifique-se de digitar um número válido.");
  }
}

double calculatorIMC(Person person) {
  if (person.height <= 0) {
    throw Exception("Altura inválida. A altura deve ser maior que zero.");
  }
  return person.weight / (person.height * person.height);
}
