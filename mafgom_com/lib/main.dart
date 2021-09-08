import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Merhaba",
      home: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  // Bütün tanımlamalar genellikle bu kısma yapılır.

  int tiklama = 0;

  void ogeTiklama(int index) {
    setState(() {
      tiklama = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AHMET YILMAZ'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  100, 10, 100, 10), // Yazıyı ortalamak amaçlı yazıldı.
              child: Text(
                "MAFGOM - Gömülü sistemler ",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Text("ORHAN YILMAZ"),
            SizedBox(
              // Koyacağım url ile arasında boşluk olması için yazıldı.
              height: 30,
            ),
            AspectRatio(
              // URL 'nin boyutunu ayarlayan satır.
              aspectRatio:
                  1, // aspectRatio: 1 = 1 yerine 16/9 gibi boyutlar da  yazılabilir
              child: WebView(
                initialUrl: "https://mafgom.com",
                javascriptMode: JavascriptMode.unrestricted,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey, // Arka fon
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home>',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: '<Contact Mail>',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons
                .school), // school kısmı hazır simgelerden kullanılan iconlar.
            label: '<School>',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: '<Mesaj Kutusu')
        ],
        currentIndex: tiklama,
        selectedItemColor: Colors.black,
        onTap: ogeTiklama,
      ),
    );
  }
}
