import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:led_app/ust_basliklar/CalismaModu.dart';
import 'package:led_app/ust_basliklar/LedGrubu.dart';
import 'package:led_app/ust_basliklar/RenkBilgisi.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Center(
          child: Text("LED Application"),
        ),
      ),
      body: SafeArea(
          child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              backgroundColor: Colors.red,
              unselectedBackgroundColor: Colors.grey[300],
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(
                  icon: Icon(Icons.school),
                  text: "Çalışma Modu",
                ),
                Tab(
                  icon: Icon(Icons.light_mode),
                  text: "Led Grubu",
                ),
                Tab(
                  icon: Icon(Icons.color_lens),
                  text: "Renk Bilgisi",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: CalismaModu(),
                  ),
                  Center(
                    child: LedGrubu(),
                  ),
                  Center(
                    child: RenkBilgisi(),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
