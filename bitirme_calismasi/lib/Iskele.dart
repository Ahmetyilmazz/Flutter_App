// ignore: file_names
import 'package:bitirme_calismasi/Bisection.dart';
import 'package:bitirme_calismasi/NewtonRaphson.dart';
import 'package:flutter/material.dart';

class Iskele extends StatefulWidget {
  const Iskele({super.key});

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Kullanmak istediginiz metoda tiklayiniz:",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0), // Yazının Rengi
                fontSize: 17, // Yazının fontu
                fontWeight: FontWeight.w600), // Yazını kalınlığı
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const NewtonRaphsonPage()), // Butona basıldığında yapılacak işlem.
              );
            },
            child: const Text(
              "1 - Newton - Raphson Metodu",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              // Yazının arka plan rengi
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const BisectionMethodPage()), // Butona basıldığında yapılacak işlem.
              );
            },
            child: const Text(
              "2 - Bisection (İkiye Ayirma) Metodu",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              // Yazının arka plan rengi
            ),
          ),
        ],
      ),
    );
  }
}
