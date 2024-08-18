import 'package:flutter/material.dart';
import 'package:todo_sqlite/ana_ekran.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLogin = true;
  String? errorMessage;

  Future<void> createUser() async {
    try {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AnaEkran(
            aciklama: '',
            baslik: '',
          ),
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = handleError(e);
      });
    }
  }

  Future<void> signIn() async {
    try {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AnaEkran(
            aciklama: '',
            baslik: '',
          ),
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = handleError(e);
      });
    }
  }

  String handleError(dynamic error) {
    return 'Bir hata oluştu. Lütfen tekrar deneyin.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.red,
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
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hosgeldiniz",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Sifre',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                  ),
                  errorMessage != null
                      ? Text(errorMessage!)
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (isLogin) {
                          signIn();
                        } else {
                          createUser();
                        }
                      },
                      child: isLogin
                          ? const Text(
                              "Giris Yap",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              "Kayit Ol",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: const Text("Henüz hesabiniz yok mu? Tiklayin"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
