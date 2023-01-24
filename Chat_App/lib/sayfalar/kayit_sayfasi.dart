import 'package:chat_app/sayfalar/ana_ekran.dart';
import 'package:flutter/material.dart';

class KayitOl extends StatelessWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Sayfası"),
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Ad - Soyad",
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Kullanıcı Adı",
                  ),
                ),
                TextFormField(
                  obscureText: true, // Karakter görüntüsünü gizle.
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Şifre",
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "E- Mail",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // GİRİŞ BUTONU YAPILANDIRMASI.
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnaEkran()));
                  },
                  child: const Text("Kayıt OL"),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
