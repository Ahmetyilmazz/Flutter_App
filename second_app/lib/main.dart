import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String baslik = "İLK UYGULAMA _V1";
  String ortaYazi = "TIKLAMA BUTONU";
  @override
  Widget build(BuildContext context) {
    var isimler = ["AHMET YILMAZ", "ORHAN YILMAZ", "ALİ YILDIZ", "MEHMET HACI"];
    return Scaffold(
      appBar: AppBar(
        title: Text(baslik),
      ),
      // BUTON YAPILANDIRMASI
      body: Column(
        children: [
          // expanded size gibi hataları alınca listenin column gbi olmasını sağlıyor.
          Expanded(
              child: ListView.builder(
                  itemCount:
                      isimler.length, // kac elemandan olusuyorsa hepsini ver.
                  itemBuilder: (BuildContext context, int index) {
                    return Text(isimler[index]);
                  })),
          Center(
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: Text(ortaYazi),
              onPressed: () {
                var alert = AlertDialog(
                  title: Text("BUTONDAN SONRAKİ BAŞLIK"),
                  content: Text("WWW.MAFGOM.COM"),
                );

                showDialog(
                    context: context, builder: (BuildContext context) => alert);
              },
            ),
          ),
        ],
      ),
    );
  }
}
