import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool isLoginConfirmed = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 70.0),
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: 280.0,
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                width: 280.0,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Senha",
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  // Navegação para a tela de recuperação de senha
                },
                child: const Text(
                  "Esqueceu a senha? Clique aqui.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Checkbox(
                      value: rememberMe,
                      fillColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      checkColor: const Color.fromRGBO(178, 33, 36, 1),
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "Lembrar de mim.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () async {
                  await getData();
                },
                color: Colors.white,
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    var db = FirebaseFirestore.instance;
    final ref = await db
        .collection("users")
        .where("E-mail", isEqualTo: emailController.text)
        .where("Senha", isEqualTo: passwordController.text)
        .get();
    final docs = ref.docs;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (docs.isNotEmpty) {
      // Obter o ID do documento
      String documentId = docs[0].id;

      // Salvar o ID do documento no Shared Preferences
      await prefs.setString('userDocumentId', documentId);

      setState(() {
        isLoginConfirmed = true;
      });
      Navigator.of(context).pushNamed("/LojaMainPage");
    } else {
      setState(() {
        isLoginConfirmed = false;
      });
      showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              title: const Text("Credenciais inválidas"),
              content: const Text(
                  "Email ou senha incorretos. Tente novamente."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Ok"),
                ),
              ],
            ),
      );
    }
  }
}