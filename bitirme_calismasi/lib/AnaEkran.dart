// ignore: file_names
import 'package:bitirme_calismasi/Iskele.dart';

import 'package:flutter/material.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38, // GÖvde arka plan rengi
      appBar: AppBar(
        backgroundColor: Colors.red, // AppBar arka plan rengi
        title: const Center(
          child: Text("Nümerik Analiz - Kök Bulma İşlemleri"),
        ),
      ),
      body: const Iskele(),
    );
  }
}
