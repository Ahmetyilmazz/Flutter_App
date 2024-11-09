import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'Ahmet YILMAZ',
        textColor: Colors.white,
        backgroundColor: Colors.red,
        email: 'ahmeet.ylmzzz@gmail.com',
      ),
      backgroundColor: Colors.brown,
      body: ContactUs(
        cardColor: Colors.white,
        textColor: Colors.black,
        logo: const AssetImage('assets/profil.jpg'),
        email: 'ahmeet.ylmzzz@gmail.com',
        companyName: 'Ahmet YILMAZ',
        companyColor: Colors.black,
        phoneNumber: '+90555555555',
        dividerThickness: 2,
        website: "https://ahmetyilmazz.github.io/",
        githubUserName: 'Ahmetyilmazz',
        linkedinURL: 'https://www.linkedin.com/in/ahmeeet/',
        tagLine: 'Jr. Flutter Developer',
        taglineColor: Colors.red,
        instagram: 'ahmet.ylmzzz',
      ),
    );
  }
}
