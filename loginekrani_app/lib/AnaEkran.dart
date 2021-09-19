import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'p_login.dart';
import 'p_register.dart';

class AnaEkran extends StatelessWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("GİRİŞ - KAYIT OL")),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(50.0),
              // LOGİN İKON
              child: AnimatedButtonBar(
                invertedSelection: true, // sağ tıkla da açılmasını sağlar.
                radius: 30.0,
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.blueGrey.shade800,
                foregroundColor: Colors.blueGrey.shade300,
                elevation: 24,
                borderColor: Colors.white,
                borderWidth: 3,
                innerVerticalPadding: 16,
                children: [
                  ButtonBarEntry(
                      child: Icon(Icons.login),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => p_login()));
                      }),
                  ButtonBarEntry(
                      child: Icon(Icons.app_registration_rounded),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => p_register()));
                      })
                ],
              )),
          ElevatedButton(onPressed: () {}, child: Text("GİRİŞ YAP - KAYIT OL"))
        ],
      ),
    );
  }
}
