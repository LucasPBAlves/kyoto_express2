import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/confirmacao.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16.0),
                    const Text(
                      'Insira o seu e-mail abaixo e verificaremos se é válido',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, "/SenhaNova");
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                  title: const Text(
                                      "Por favor, coloque seu email"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context),
                                      child: const Text("Ok"),
                                    )
                                  ]));
                        }
                      },
                      child: const Text('Validar'),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}