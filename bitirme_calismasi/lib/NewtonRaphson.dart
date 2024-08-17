// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

class NewtonRaphsonPage extends StatefulWidget {
  const NewtonRaphsonPage({super.key});

  @override
  _NewtonRaphsonPageState createState() => _NewtonRaphsonPageState();
}

class _NewtonRaphsonPageState extends State<NewtonRaphsonPage> {
  // ignore: prefer_function_declarations_over_variables
  final Function f = (double x) => 3 * x - cos(x) - 1;
  // ignore: prefer_function_declarations_over_variables
  final Function g = (double x) => 3 + sin(x);

  double x0 = 0.0;
  double x1 = 0.0;
  double f0 = 0.0;
  double f1 = 0.0;
  double g0 = 0.0;
  double e = 0.0;
  int step = 1;
  int N = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Newton Raphson'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Newton Raphson Method',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'İlk Tahmin:',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    x0 = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Kabul edilebilir Hata:',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    e = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Maksimum Yineleme:',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    N = int.tryParse(value) ?? 0;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    calculateNewtonRaphson();
                  });
                },
                child: const Text('Çözümü Hesapla'),
              ),
              const SizedBox(height: 16),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }

  void calculateNewtonRaphson() {
    g0 = g(x0);
    f0 = f(x0);

    if (g0 == 0.0) {
      setState(() {
        result = 'Matematiksel Hata.';
      });
      return;
    }

    x1 = x0 - f0 / g0;

    setState(() {
      result +=
          'Adim $step: x0=$x0, f(x0) = $f0, x1 = $x1, f(x1) = $f1 \n'; // sonuçları ekrana yazdırma
    });

    x0 = x1;
    step++;

    if (step > N) {
      setState(() {
        result = 'Yakinsak Degil.';
      });
      return;
    }

    f1 = f(x1);

    if (f1.abs() <= e) {
      setState(() {
        result += '\nBulunan kök: $x1 \n'; // sonuçları ekrana yazdırma
      });
      return;
    }

    calculateNewtonRaphson();
  }
}
