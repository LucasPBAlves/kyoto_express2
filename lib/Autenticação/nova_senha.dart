import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

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
                      'Digite sua nova senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'Nova senha',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite sua nova senha';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'Repita a senha',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, repita sua nova senha';
                        }
                        if (value != _passwordController.text) {
                          return 'As senhas não coincidem';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: implement password reset logic
                          print("Senha resetada com sucesso");
                        }
                      },
                      child: const Text('Redefinir senha'),
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