import 'package:chat_app/sayfalar/ana_ekran.dart';
import 'package:chat_app/sayfalar/kayit_sayfasi.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Chat Uygulaması")),
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /*
                const SizedBox(
                  height: 50,
                ),
                */
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
                  child: const Text("Giriş Yap"),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Hesabın yok mu?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                // KAYIT OL BUTONU YAPILANDIRMASI.
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KayitOl()));
                  },
                  child: const Text("Kayıt OL !"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
