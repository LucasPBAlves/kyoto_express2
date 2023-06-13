import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  bool preencheu = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Cadastro.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 150.0),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Escreva seu nome';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Escreva seu E-mail';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'Telefone',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Escreva seu telefone';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: cpfController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'CPF',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: adressController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'Endereço',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Escreva a senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40.0),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            preencheu = true;
                          });
                          setData(
                              cpfController.text.trim(),
                              emailController.text.trim(),
                              adressController.text.trim(),
                              nameController.text.trim(),
                              passwordController.text.trim(),
                              phoneController.text.trim());
                          Navigator.pushNamed(context, "/Verificar");
                        } else {
                          setState(() {
                            preencheu = false;
                          });
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  AlertDialog(
                                      title: const Text(
                                          "Precisa preencher os dados"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Ok"),
                                        )
                                      ]));
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text('Próximo'),
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

  void setData (String cpfController, String emailController, String adressController, String nameController, String passwordController, String phoneController) {

    var db = FirebaseFirestore.instance;

    // Add a new document with a generated ID
    db
        .collection("users")
        .add(<String, dynamic>{
      "CPF": cpfController,
      "E-mail": emailController,
      "Endereço": adressController,
      "Nome": nameController,
      "Senha": passwordController,
      "Telefone": phoneController,
      "adm": false,
      "entregador": false,
    }).then((DocumentReference doc) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userDocumentId', doc.id);
      prefs.setString('userEmail', emailController);
      prefs.setString('userName', nameController);
    });


  }
}