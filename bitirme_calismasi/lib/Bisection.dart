// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:math';

class BisectionMethodPage extends StatefulWidget {
  const BisectionMethodPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BisectionMethodPageState createState() => _BisectionMethodPageState();
}

class _BisectionMethodPageState extends State<BisectionMethodPage> {
  TextEditingController x0Controller = TextEditingController();
  TextEditingController x1Controller = TextEditingController();
  TextEditingController eController = TextEditingController();

  String result = '';

  void bisectionMethod() {
    double x0 = double.parse(x0Controller.text);
    double x1 = double.parse(x1Controller.text);
    double e = double.parse(eController.text);

    double f(double x) {
      return cos(x) - x * exp(x); // Çözülecek olan denklem
    }

    // Fonksiyon değerlerinin hesaplanması
    double f0 = f(x0);
    double f1 = f(x1);

    // Tahminlerin kontrolü
    if (f0 * f1 > 0) {
      setState(() {
        result = 'İlk tahminler yanliş!';
      });
      return;
    }

    // Bisection Methodunu Uygulama (İkiye Ayırma)
    int step = 1;
    double x2, f2;
    while (true) {
      x2 = (x0 + x1) / 2;
      f2 = f(x2);

      setState(() {
        result +=
            'Adim $step: x0=$x0, x1=$x1, x2=$x2, f(x2)=$f2 \n'; // sonuçları ekrana yazdırma
      });

      if (f0 * f2 < 0) {
        x1 = x2;
        f1 = f2;
      } else {
        x0 = x2;
        f0 = f2;
      }
      step++;

      if (f2.abs() < e) {
        setState(() {
          result += '\nBulunan kök: $x2 \n'; // sonuçları ekrana yazdırma
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Bisection Method'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bisection Method',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: x0Controller,
                decoration: const InputDecoration(labelText: 'x0'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: x1Controller,
                decoration: const InputDecoration(labelText: 'x1'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: eController,
                decoration: const InputDecoration(labelText: 'e'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: bisectionMethod,
                child: const Text('Çözümü Hesapla'),
              ),
              const SizedBox(height: 20),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
