// ignore: file_names
import 'package:flutter/material.dart';

class LedGrubuEkle extends StatelessWidget {
  const LedGrubuEkle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Led Grubu Ekle"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Grup Ad",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "First Index",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "End Index",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Renk",
                ),
              ),
              ElevatedButton(
                onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const AlertDialog(
                          content: Text("Led Grubunuz Eklenmiştir."),
                          actions: <Widget>[],
                        )),
                child: const Text("Ekle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
