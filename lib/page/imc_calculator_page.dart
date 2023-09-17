import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_imc_calculator/class/imc.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculadoraIMC(),
  ));
}

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({Key? key}) : super(key: key);

  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final List<IMC> _dadosIMC = [];

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void _adicionarIMC() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double imc = weight / (height * height);

      String resultadoIMC = _classificarIMC(imc);

      IMC novoIMC = IMC.withCategory(imc, DateTime.now());
      _dadosIMC.add(novoIMC);
      weightController.clear();
      heightController.clear();

      debugPrint("weight(peso): $weight");
      debugPrint("height(altura): $height");
      debugPrint("IMC calculado: $imc");
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Peso (kg)'),
          ),
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Altura (m)'),
          ),
          ElevatedButton(
            onPressed: _adicionarIMC,
            child: const Text('Calcular IMC'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dadosIMC.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      'IMC: ${_dadosIMC[index].value.toStringAsFixed(3)}',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categoria: ${_dadosIMC[index].category}',
                        ),
                        Text(
                          'Data: ${DateFormat.yMd().format(_dadosIMC[index].date)}',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
