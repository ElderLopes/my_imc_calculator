import 'package:flutter/material.dart';
import 'package:my_imc_calculator/page/imc_calculator_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const CalculadoraIMC(),
    );
  }
}
