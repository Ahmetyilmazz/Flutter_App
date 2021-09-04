import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*ÇALIŞMA MANTIĞI: 
  Uygulamayı açtığınız zaman sizi bir ekran karşılayacak. Karışınıza çıkan uyarının altındaki boşluğa
  tahmin edeceğiniz sayıyı giriniz ardından "Sonucu görmek için tıklayın" butonuna bastığınızda
  "Sonuç: null" kısmı değişecektir. Eğer üretilen random sayi ile tahmin ettiğiniz sayı aynı ise TRUE, 
  farklı ise FALSE yazısı çıkacaktır. Buna göre değerlendirebilirsiniz...
*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // SAĞ ÜSTTEKİ DEBUG YAZISINI KALDIRAN SATIR.
      title: 'SAYİ_TAHMİN_OYUNU',
      home: Deneme(),
    );
  }
}

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
  var son1, son2;

  // RANDOM ÜRETİLEN SAYI VE TAHMİN EDİLEN SAYININ KARŞILAŞTIRILMASINI SAĞLAYAN FONKSİYON.
  void sonuc() {
    setState(() {
      // setState AMACI SÜREKLİ YENİLEMEK.
      int sayi = Random().nextInt(100); // RANDOM ÜRETİLEN SAYININ KODU.
      print(sayi);
      if (sayi == num.parse(t1.text)) {
        son1 = true;
      } else {
        son1 = false;
      }
    });
  }

  TextEditingController t1 =
      TextEditingController(); // TextField'in içindekileri okuyan satır.

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
          50.0), // TAHMİN EDİLEN KISMI SAĞA GETİRMEYE YARAYAN SATIR.
      child: Center(
        child: Column(
          children: [
            Text(
                ""), // SONUÇ YAZISINI DAHA DA AŞAĞIYA İNDİRMEK AMACIYLA YAZILAN SATIR.
            Text(
                ""), // SONUÇ YAZISINI DAHA DA AŞAĞIYA İNDİRMEK AMACIYLA YAZILAN SATIR.
            Text(
              "!!! Lütfen 1-100 arasında bir tahmin yapın !!! ",
              style: TextStyle(
                  color: Colors.red[500], // Text rengini ayarlayan satır.
                  fontStyle: FontStyle
                      .normal), // Text içerisindeki yazıyı italic hale getiren satır.
            ),
            TextField(
              style: TextStyle(
                  color: Colors
                      .black), // Tahmin edilecek sayının rengini sağlayan satır.
              controller: t1,
            ),
            Text(""), // BU SATIRLARIN AMACI GÖRÜNÜŞÜ GÜZELLEŞTİRMEK.
            TextButton(
                onPressed: sonuc, child: Text("Sonucu görmek için tıklayın")),
            Text(""), // BU SATIRLARIN AMACI GÖRÜNÜŞÜ GÜZELLEŞTİRMEK.
            Text(
                "BİLGİLENDİRME : True, Doğru anlamına; False, Yanlış anlamına gelmektedir."),
            Text(""), // BU SATIRLARIN AMACI GÖRÜNÜŞÜ GÜZELLEŞTİRMEK.
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
