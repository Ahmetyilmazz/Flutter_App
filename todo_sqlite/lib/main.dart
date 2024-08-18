import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todo_sqlite/ana_ekran.dart';
//import 'package:todo_sqlite/sayfalar/kayit_sayfasi.dart';
//import 'package:todo_sqlite/sayfalar/login_sayfasi.dart';

Future<void> main() async {
  // Splash_Screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    const Duration(seconds: 5),
  );
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AnaEkran(
              baslik: '',
              aciklama: '',
            ),
        //'/secondRoute': (context) => const KayitOl(),
      },
    );
  }
}
