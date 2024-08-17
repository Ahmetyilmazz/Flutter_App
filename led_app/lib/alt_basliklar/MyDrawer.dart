// ignore: file_names
import 'package:flutter/material.dart';
import 'package:led_app/alt_basliklar/LedGrubuEkle.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              child: const Center(child: Text("ÖZELLİKLER")),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Led Grubu Ekle"),
              onTap: () {
                // LED GRUBU EKLEME SAYFASINA YÖNLENDİR
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LedGrubuEkle()));
              },
            ),
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Led Grubu Ekle"),
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const AlertDialog(
                          alignment: Alignment.center,
                          content: LedGrubuEkle(),
                          actions: <Widget>[],
                        ))),
          ],
        ),
      ),
    );
  }
}
