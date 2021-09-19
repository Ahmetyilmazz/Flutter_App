import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class p_login extends StatelessWidget {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Kullanıcı Adı",
                ),
                controller: c1,
              ),
              TextFormField(
                obscureText: true, // Parolayı gizleyen kısım.
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Şifre",
                ),
                controller: c2,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {}, child: Text("GİRİŞ YAP"))
            ],
          ),
        ),
      ),
    );
  }
}
