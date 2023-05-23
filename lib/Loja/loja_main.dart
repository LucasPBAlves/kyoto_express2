import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Carrinho/carrinho_model.dart';
import 'product_list.dart';

class LojaMainPage extends StatefulWidget {
  const LojaMainPage({super.key});

  @override
  LojaMainPageState createState() => LojaMainPageState();
}

class LojaMainPageState extends State<LojaMainPage> {
  get padding => null;
  late SharedPreferences prefs;
  late String userDocumentId;
  late String userEmail;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  get fontSize => 24;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    userDocumentId = prefs.getString('userDocumentId') ?? '';
    userEmail = prefs.getString('userEmail') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFede6dd),
      key: _scaffoldKey,

      //Barra
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 16.0),
          icon: const Icon(Icons.menu, color: Color(0xFF202020)),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined,
                  color: Color(0xFF202020)),
              onPressed: () {
                Navigator.pushNamed(context, '/Carrinho');
              },
            ),
          ),
        ],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Color(0xFF202020)),
            SizedBox(width: 8),
            Text('Localização', style: TextStyle(color: Color(0xFF202020))),
          ],
        ),
      ),

      //Menu
      drawer: Drawer(
    child: Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/Menu.png"),
    fit: BoxFit.cover,
    ),
    ),
        child: Column(

          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Nome do Usuário'),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color(0x00202020).withOpacity(0.8),
                child: const Icon(Icons.person,
                    color: Color(0xFFede6dd), size: 40),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFB22124).withOpacity(0.85),

                //border: Border(top: BorderSide.none),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey),
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: const Text('Pedidos'),
                      onTap: () {
                        Navigator.pushNamed(context, "/Pedidos");
                        // ação quando clicar em Pedidos
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.payment),
                      title: const Text('Pagamento'),
                      onTap: () {
                        Navigator.pushNamed(context, "/Pagamentos");
                        // ação quando clicar em Pagamento
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.local_offer),
                      title: const Text('Cupons'),
                      onTap: () {
                        Navigator.pushNamed(context, "/Cupom");
                        // ação quando clicar em Cupons
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.card_giftcard),
                      title: const Text('Fidelidade'),
                      onTap: () {
                        Navigator.pushNamed(context, "/Fidelidade");
                        // ação quando clicar em Fidelidade
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favoritos'),
                      onTap: () {
                        Navigator.pushNamed(context, "/Favoritos");
                        // ação quando clicar em Favoritos
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.chat),
                      title: const Text('Chat'),
                      onTap: () {
                        Navigator.pushNamed(context, "/Chat");
                        // ação quando clicar em Chat
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Ajuda'),
              onTap: () {
                // ação quando clicar em Ajuda
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                // ação quando clicar em Configurações
              },
            ),
          ],
        ),
    ),

      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25.0),

            //Barra de promoções
            InkWell(
              onTap: () {
                // Ação quando a caixa for clicada
              },
              child: Container(
                width: 330,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFb22124),
                  borderRadius: BorderRadius.circular(10),
                  /*
                  image: DecorationImage(
                    image: AssetImage('caminho/para/imagem.jpg'),
                    fit: BoxFit.cover,
                  ),
                   */
                ),
                child: const Center(
                    child: Text(
                  'Promoções',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),

            const SizedBox(height: 15.0),

            //Barra de Pesquisa
            Container(
              padding: const EdgeInsets.only(
                  top: 20.0, right: 25.0, left: 25.0, bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                  hintText: 'Pesquisar',
                  hintStyle: const TextStyle(color: Color(0xFF202020)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0xFF202020)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            //Botões de Categoria
            Column(
              children: [
                const SizedBox(height: 15.0),
                // Barra de Categorias

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        // Ação quando o botão for clicado
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Categoria 1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Ação quando o botão for clicado
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Categoria 2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Ação quando o botão for clicado
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Categoria 3',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Ação quando o botão for clicado
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Categoria 4',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),

                // Coloque aqui o conteúdo da sua página
              ],
            ),

            //Carroussel
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  double itemWidth = MediaQuery.of(context).size.width / 2 -
                      12; // 2 colunas com 8 de espaçamento
                  return Container(
                    width: itemWidth,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ScopedModelDescendant<CartModel>(
                      builder: (context, child, model) {
                        return Card(
                          color: const Color(0xFBf6f2ee),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 16),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  products[index].imgUrl,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                products[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text("R\$${products[index].price}"),
                              const SizedBox(height: 8),
                              TextButton(
                                child: const Text("Comprar"),
                                  onPressed: () => model.addProduct(products[index]))

                          ]
                          )
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25.0),

            //Populares
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: const Text(
                "Populares",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )

    /*
    ListView.builder(
      itemCount: selectedProducts.length,
      itemBuilder: (BuildContext context, int index) {
        final product = selectedProducts[index];
        return ListTile(
          leading: Image.network(
            product.imgUrl,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          title: Text(product.title),
          subtitle: Text("R\$ ${product.price.toStringAsFixed(2)}"),
        );
      },
    )
     */

            // Coloque aqui o conteúdo da sua página
          ],
        ),
      ),
    );

  }

}

