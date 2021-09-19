import 'package:flutter/material.dart';

class p_register extends StatelessWidget {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(50.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Adınız",
              ),
              controller: c1,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Soyadınız",
              ),
              controller: c2,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Kullanıcı Adı",
              ),
              controller: c3,
            ),
            TextFormField(
              obscureText: true, // Parolayı gizleyen kısım.
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Şifre",
              ),
              controller: c4,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Mail Adresi",
              ),
              controller: c5,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {}, child: Text("KAYIT OL"))
          ],
        ),
      ),
    );
  }
}
