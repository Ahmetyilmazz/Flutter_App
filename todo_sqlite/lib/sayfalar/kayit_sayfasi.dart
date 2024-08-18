// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_sqlite/ana_ekran.dart';

class KayitOl extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const KayitOl({Key? key});

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  final TextEditingController _adSoyadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  @override
  void dispose() {
    _adSoyadController.dispose();
    _emailController.dispose();
    _telefonController.dispose();
    _sifreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(60, 60),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.person_add,
                  size: 50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputForm("Ad - Soyad", _adSoyadController),
                  const SizedBox(
                    height: 20,
                  ),
                  inputForm("Email", _emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  inputForm("Telefon", _telefonController),
                  const SizedBox(
                    height: 20,
                  ),
                  inputForm("Sifre", _sifreController, isObscure: true),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Burada kayıt işlemleri yapılabilir
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const AnaEkran(
                              baslik: '',
                              aciklama: '',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Kayit Ol",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputForm(String title, TextEditingController controller,
      {bool isObscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
          child: TextField(
            controller: controller,
            obscureText: isObscure,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
