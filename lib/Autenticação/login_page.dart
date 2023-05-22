import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0.0),
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
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0.0),
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
                      fillColor: MaterialStateProperty.all<Color>(Colors.white),
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
                onPressed: () {
                  if (passwordController.text == "1234") {
                    setState(() {
                      isLoginConfirmed = true;
                    });

                    Navigator.pushNamed(context, "/LojaMainPage");
                  } else {
                    setState(() {
                      isLoginConfirmed = false;
                    });
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                                title: const Text("Senha incorreta"),
                                content:
                                    const Text("Senha incorreta. Tente Novamente."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Ok"),
                                  )
                                ]));
                  }
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
  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator())
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }

    Navigator.of("/LojaMainPage" as BuildContext);
  }
}
