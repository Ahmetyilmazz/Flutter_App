import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'anaekran.dart';

/*ÇALIŞMA MANTIĞI: 
  Uygulamayı açtığınız zaman sizi bir ekran karşılayacak. Karışınıza çıkan uyarının altındaki boşluğa
  tahmin edeceğiniz sayıyı giriniz ardından "Sonucu görmek için tıklayın" butonuna bastığınızda
  "Sonuç: null" kısmı değişecektir. Üretilen sayı ile tahmininiz karşılaştırılıp size sonuç gösterilecektir.
   Buna göre değerlendirebilirsiniz...
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
