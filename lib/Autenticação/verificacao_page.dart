import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  VerificationPageState createState() => VerificationPageState();
}

class VerificationPageState extends State<Verification> {
  String selectedOption = 'Email';
  bool verificou = false;
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/confirmacao.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Foto do usuário e nome

                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  'Nome do usuário',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                // Campo de texto para o código de verificação
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: codeController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      hintText: 'Código de verificação',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Botão para reenviar o código de verificação por email
                ElevatedButton(
                  onPressed: () {
                    // Lógica para reenviar o código de verificação por email
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Reenviar código por email',
                  ),
                ),
                const SizedBox(height: 10),

                // opção de envio
                SizedBox(
                  width: 200,
                  child: DropdownButtonFormField<String>(
                    dropdownColor: const Color(0xFFB22124),
                    value: selectedOption,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                    items: <String>['Email', 'SMS', 'WhatsApp']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),

                // Botão para enviar o código de verificação

                ElevatedButton(
                  onPressed: () {
                    if (codeController.text == '456') {
                      setState(() {
                        verificou = true;
                      });

                      Navigator.pushNamed(context, "/Cartao");
                    } else {
                      setState(() {
                        verificou = false;
                      });
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                  title: const Text("Codigo incorreto"),
                                  content: const Text("Codigo incorreto. Tente Novamente."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Ok"),
                                    )
                                  ]));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Enviar código'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
