import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class p_login extends StatelessWidget {
  const p_login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Container(
        margin: const EdgeInsets.all(50.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Kullanıcı Adı",
                  ),
                ),
                TextFormField(
                  obscureText: true, // Parolayı gizleyen kısım.
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Şifre",
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                    onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                              content: Text("Giriş Yapıldı."),
                              actions: <Widget>[],
                            )),
                    child: const Text("GİRİŞ YAP"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
