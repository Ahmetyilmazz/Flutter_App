import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deneme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blueGrey[800], // Arka plan rengini ayarlayan satır.
      appBar: AppBar(
        title: Text("SAYI_TAHMİN_OYUNU"),
        backgroundColor: Colors.red[900], // App bar rengini ayarlayan satır.
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
  var son1;
  // t2 tahmin ettiği sayı.

  // RANDOM ÜRETİLEN SAYI VE TAHMİN EDİLEN SAYININ KARŞILAŞTIRILMASINI SAĞLAYAN FONKSİYON.
  void sonuc() {
    setState(() {
      // setState AMACI SÜREKLİ YENİLEMEK.
      int sayi = Random().nextInt(100); // RANDOM ÜRETİLEN SAYININ KODU.
      print(sayi);
      if (sayi == num.parse(t2.text)) {
        son1 = "Tebrikler, doğru bildiniz !";
      } else {
        son1 = "Maalesef, bilemediniz. Tutulan sayi : $sayi ";
      }
    });
  }

  TextEditingController t2 =
      TextEditingController(); // TextField'in içindekileri okuyan satır.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
          50.0), // TAHMİN EDİLEN KISMI SAĞA GETİRMEYE YARAYAN SATIR.
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ), // Boşluk bırakma
            Text(
              "Boşluğa tahmininizi yazınız  !!! ",
              style: TextStyle(
                color: Colors.red, // Text rengini ayarlayan satır.
                fontStyle: FontStyle.normal,
              ), // Text içerisindeki yazıyı italic hale getiren satır.
            ),
            // Kullanmak istediği hak sayisi
            TextField(
              style: TextStyle(
                  color: Colors
                      .blue), // Tahmin edilecek sayının rengini sağlayan satır.
              controller: t2,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: sonuc, child: Text("Sonucu görmek için tıklayın")),
            SizedBox(
              height: 10, // Boşluk bırakma
            ),
            Text(
              "Sonuç : $son1",
              style: TextStyle(
                  color: Colors.red[
                      500]), // Sonuç yazısını belirtmek için yazılan satır.
            ),
          ],
        ),
      ),
    );
  }
}
