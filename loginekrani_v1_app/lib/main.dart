import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'p_login.dart';
import 'p_register.dart';

void main() => runApp(const MyApp());

// MAİN.DART
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Uygulaması _ v1',
      home: AnaEkran(),
    );
  }
}

// ANA EKRAN.DART
class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("GİRİŞ - KAYIT OL"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: AnimatedButtonBar(
                invertedSelection: true,
                radius: 30.0,
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.blueGrey.shade800,
                foregroundColor: Colors.blueGrey.shade300,
                elevation: 24,
                borderColor: Colors.white,
                borderWidth: 3,
                innerVerticalPadding: 16,
                children: [
                  // LOGİN PENCERESİ
                  ButtonBarEntry(
                    onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                              //title: Text('LOGİN PENCERESİ'),
                              content: p_login(),
                              actions: <Widget>[],
                            )),
                    child: const Icon(Icons.login),
                  ),
                  ButtonBarEntry(
                    onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                              //title: Text('KAYIT OL PENCERESİ'),
                              content: p_register(),
                              actions: <Widget>[],
                            )),
                    child: const Icon(Icons.app_registration_rounded),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
