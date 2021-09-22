import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class p_register extends StatelessWidget {
  const p_register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Container(
        margin: const EdgeInsets.all(50.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Adınız",
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Soyadınız",
                  ),
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
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Mail Adresi",
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                    onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                              content: Text("Kaydınız Tamamlanmıştır."),
                              actions: <Widget>[],
                            )),
                    child: const Text("KAYIT OL"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
