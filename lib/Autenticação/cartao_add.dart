import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CartaoScreen extends StatefulWidget {
  const CartaoScreen({super.key});

  @override
  CartaoScreenState createState() => CartaoScreenState();
}

class CartaoScreenState extends State<CartaoScreen> {
  // variáveis que armazenarão os dados do cartão
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/confirmacao.jpg'),
            fit: BoxFit.fill,
          ),
          color: Colors.black,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                labelExpiredDate: 'MM/AA',
                labelCardHolder: 'NOME DO TITULAR',
                glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                bankName: 'Kyoto Express',
                frontCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: Colors.white,
                backgroundImage:
                    useBackgroundImage ? 'assets/images/Card_Bg(1).png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/images/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(

                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.white,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Número',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Data de Validade',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Nome no Cartão',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /*
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Esconder o Cartão',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: useGlassMorphism,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.red,
                              onChanged: (bool value) => setState(() {
                                useGlassMorphism = value;
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Card Image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: useBackgroundImage,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.blue,
                              onChanged: (bool value) => setState(() {
                                useBackgroundImage = value;
                              }),
                            ),
                          ],
                        ),
                      ),
                       */
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _onValidate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(237, 230, 221, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 48.0,
                          ),
                        ),
                        child: const Text(
                          'Finalizar Cadastro',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              fontFamily: 'halter',
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/LojaMainPage");
                        },
                        child: const Text(
                          'Adicionar método de pagamento depois.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, "/LojaMainPage");
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
              title: const Text("Falha"),
              content:
              const Text("Cartão Cadastrado Incorretamente.\nVerifique os Dados e tente novamente."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Ok"),
                )
              ]));
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
