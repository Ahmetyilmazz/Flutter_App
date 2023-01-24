import 'package:chat_app/sayfalar/TabBar/aramalar.dart';
import 'package:chat_app/sayfalar/TabBar/ayarlar.dart';
import 'package:chat_app/sayfalar/TabBar/sohbetler.dart';
import 'package:flutter/material.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // TABBAR KISMI
          bottom: const TabBar(
            tabs: [
              Tab(
                //icon: Icon(Icons.chat_bubble), // İKON YAPILANDIRMASI
                child: Text("Sohbetler"),
              ),
              Tab(
                //icon: Icon(Icons.call), // İKON YAPILANDIRMASI
                child: Text("Aramalar"),
              ),
              Tab(
                //icon: Icon(Icons.settings), // İKON YAPILANDIRMASI
                child: Text("Ayarlar"),
              ),
            ],
          ),
          //leading: const Icon(Icons.home), // Chat - App başına ki icon kısmı
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            // SAĞDAKİ ÜÇ ÇİZGİ YAPILANDIRMASI
            PopupMenuButton(
              itemBuilder: (context) => const [
                PopupMenuItem(
                  child: Text("1"),
                  //onTap: ,
                  // value: 1,
                ),
                PopupMenuItem(
                  child: Text("2"),
                  // value: 1,
                ),
              ],
            ),
          ],
          title: const Text(
            "Chat - App",
          ),
        ),
        // Sağ alttaki "YENİ MESAJ" butonu yapılandırması.
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: const Icon(Icons.person_add),
        ),
        // Tabbar kısmı
        body: const TabBarView(
          children: [
            Sohbetler(),
            Aramalar(),
            Ayarlar(),
          ],
        ),
      ),
    );
  }
}
