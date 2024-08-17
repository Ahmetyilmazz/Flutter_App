import 'package:flutter/material.dart';
import 'package:led_app/alt_basliklar/MyDrawer.dart';

class LedGrubu extends StatefulWidget {
  const LedGrubu({super.key});

  @override
  State<LedGrubu> createState() => _LedGrubuState();
}

class _LedGrubuState extends State<LedGrubu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text("Led Grubu Tab")),
      ),
      drawer: const MyDrawer(),
    );
  }
}
