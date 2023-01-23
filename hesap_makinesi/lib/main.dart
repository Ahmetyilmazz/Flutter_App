// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

/*ÇALIŞMA MANTIĞI: 
  Uygulamayı çalıştırdığınız zaman sizi bir ekran karşılayacak ve bu ekranın Sonuç: null kısmının altındaki
  yere sizden Toplama-Çıkarma-Çarpma-Bölme işlemlerinden yapmak istediğiniz 2 sayiyi girmeniz istenecektir.
  O bölgelere istediğiniz sayıları girdikten sonra işleminizi seçip sonucunuzu görebilirsiniz.*/

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Sol üstteki debug yazısını kaldırır.
      title: 'Hesap Makinesi',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blueGrey[100], // Arka fon rengini ayarlayan satır.
      appBar: AppBar(
        title: const Text("Basit Hesap Makinesi"),
        backgroundColor:
            Colors.red[900], // AppBar'ın fon rengini ayarlayan satır.
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  var sayi1, sayi2, sonuc;

  TextEditingController t1 =
      TextEditingController(); // TextField 'in içindeki metinleri okuyabilecek.

  TextEditingController t2 =
      TextEditingController(); // TextField 'in içindeki metinleri okuyabilecek. 2 tane yazmamın amacı 2 tane TaxtField ollmasıdır.

  // TOPLAMA İŞLEMİNİN FONKSİYONU.
  sayiTopla() {
    // setState kullanmamın amacı fonk çalıştığında state güncellensin ve ekran yeniden oluşsun.
    setState(() {
      sayi1 = num.parse(t1.text); // stringi nume çevirme.
      sayi2 = num.parse(t2.text); // stringi nume çevirme.
      sonuc = sayi1 + sayi2;
    });
  }

  // ÇIKARMA İŞLEMİNİN FONKSİYONU.
  sayiCikar() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  // ÇARPMA İŞLEMİNİN FONKSİYONU
  sayiCarp() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  // BÖLME İŞLEMİNİN FONKSİYONU
  sayiBol() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
          55.0), // Düzen kısmı boyuta göre değiştirilebilir.
      child: Center(
        child: Column(
          children: [
            Text("Sonuç : $sonuc"), // Stringe $ ile çevrilebilir.
            // Metin giriş alanı
            TextField(
              controller: t1,
            ),
            TextField(
              controller: t2,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            TextButton(onPressed: sayiTopla, child: const Text("TOPLAMA")),
            TextButton(onPressed: sayiCikar, child: const Text("ÇIKARMA")),
            TextButton(onPressed: sayiCarp, child: const Text("ÇARPMA")),
            TextButton(onPressed: sayiBol, child: const Text("BÖLME")),
          ],
        ),
      ),
    );
  }
}
