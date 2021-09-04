import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*ÇALIŞMA MANTIĞI: 
  Uygulamayı çalıştırdığınız zaman sizi bir ekran karşılayacak ve bu ekranın Sonuç: null kısmının altındaki
  yere sizden Toplama-Çıkarma-Çarpma-Bölme işlemlerinden yapmak istediğiniz 2 sayiyi girmeniz istenecektir.
  O bölgelere istediğiniz sayıları girdikten sonra işleminizi seçip sonucunuzu görebilirsiniz.*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Sol üstteki debug yazısını kaldırır.
      title: 'Hesap Makinesi',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blueGrey[100], // Arka fon rengini ayarlayan satır.
      appBar: AppBar(
        title: Text("Basit Hesap Makinesi"),
        backgroundColor:
            Colors.red[900], // AppBar'ın fon rengini ayarlayan satır.
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
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
      margin: EdgeInsets.all(55.0), // Düzen kısmı boyuta göre değiştirilebilir.
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
            TextButton(onPressed: sayiTopla, child: Text("TOPLAMA")),
            TextButton(onPressed: sayiCikar, child: Text("ÇIKARMA")),
            TextButton(onPressed: sayiCarp, child: Text("ÇARPMA")),
            TextButton(onPressed: sayiBol, child: Text("BÖLME")),
          ],
        ),
      ),
    );
  }
}
