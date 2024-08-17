import 'package:flutter/material.dart';
import 'package:led_app/anaekran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LED APP',
      home: AnaEkran(),
    );
  }
}
