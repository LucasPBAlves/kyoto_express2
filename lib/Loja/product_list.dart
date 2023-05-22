import 'package:flutter/cupertino.dart';

export 'product_list.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String imgUrl;
  final String description;
  final String category;
  final String? subcategory;

  int qty;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.qty,
    required this.description,
    required this.category,
    this.subcategory,
  });
}

final List<Product> products = [
  //Entradas
  Product(
    id: 1,
    title: "Harumaki de legumes",
    description:
        "Rolinho Primavera.Massa fina recheada com legumes e temperos orientais, frito na hora",
    category: "Entradas",
    subcategory: "",
    price: 12.00,
    imgUrl:
        "https://www.lettoseafood.com.br/medias/services/harumakidepeixe.jpg?w=702&h=600&fit=fit",
    qty: 1,
  ),
  Product(
    id: 2,
    title: "Guioza",
    description:
        "Pastelzinho típico recheado com carne suína e legumes, servido cozido ou frito",
    category: "Entradas",
    subcategory: "",
    price: 14.00,
    imgUrl:
        "https://img.freepik.com/premium-photo/jiaozi-gyoza-dumplings-steamed-black-plates_106812-509.jpg",
    qty: 1,
  ),
  Product(
    id: 3,
    title: "Shimeji na manteiga",
    description:
        "Cogumelos shimeji preparados na manteiga com cebolinha e shoyu",
    category: "Entradas",
    subcategory: "",
    price: 22.00,
    imgUrl:
        "https://img.freepik.com/premium-photo/shimeji-mushroom-served-with-chives-black-stone-plate-typical-oriental-meal-detail-food-dish-closeup-selective-focus_208861-6036.jpg",
    qty: 1,
  ),
  Product(
    id: 4,
    title: "Sunomono",
    description: "Salada japonesa com kani, pepino, gergelim e molho agridoce",
    category: "Entradas",
    subcategory: "",
    price: 16.00,
    imgUrl:
        "https://media.istockphoto.com/id/1367831684/photo/sunomoni-in-black-background.jpg?s=612x612&w=0&k=20&c=dVTEboTvlorkl-v4HeN3p3XlF7pbKyAU0n9Sx21WvDo=",
    qty: 1,
  ),

  //Sashimis
  Product(
    id: 5,
    title: "Sashimi de salmão",
    description: "Fatias finas de salmão cru, fresco e bem selecionado",
    category: "Sashimi",
    price: 36.00,
    imgUrl: "https://media.istockphoto.com/id/621899966/photo/sliced-salmon-sashimi-japanese-raw-food-delicious-menu.jpg?s=170667a&w=0&k=20&c=MNEGpYaRwB14Oonl_XcBBpT0PD1oswtv-4PKcFlduzA=",
    qty: 1,
  ),
  Product(
    id: 6,
    title: "Sashimi de atum",
    description: "Fatias finas de atum cru, fresco e bem selecionado",
    category: "Sashimi",
    price: 40.00,
    imgUrl: "https://media.istockphoto.com/id/1216834462/photo/sashimi-tuna-on-a-stone-board-black-background-top-view-close-up.jpg?s=612x612&w=0&k=20&c=B8-1T9PZIYlWMS_d8q3n44RRqred1TMw8DJSakx65E0=",
    qty: 1,
  ),
  Product(
    id: 7,
    title: "Sashimi misto",
    description:
        "Porção com fatias finas de salmão, atum e peixe branco, frescos e bem selecionados",
    category: "Sashimi",
    price: 42.00,
    imgUrl: "https://www.youngssushi.com/uploads/1/3/1/9/131943073/s388635451771091130_p71_i1_w600.jpeg",
    qty: 1,
  ),

  //Temakis
  Product(
    id: 8,
    title: "Temaki Califórnia",
    description: "Arroz, kani, pepino, manga, cream cheese e gergelim",
    category: "Temaki",
    subcategory: "",
    price: 20.00,
    imgUrl:
        "https://media-cdn.tripadvisor.com/media/photo-s/14/13/a7/65/temaki-california.jpg",
    qty: 1,
  ),
  Product(
    id: 9,
    title: "Temaki Filadélfia",
    description: "Arroz, salmão cru, cream cheese e cebolinha",
    category: "Temaki",
    subcategory: "",
    price: 22.00,
    imgUrl:
        "https://receidelicia.com.br/wp-content/uploads/2021/02/oferta_15804375446480_Destaque-Temaki.jpg",
    qty: 1,
  ),
  Product(
    id: 10,
    title: "Temaki Hot Filadélfia",
    description:
        "Arroz, salmão cru, cream cheese, cebolinha e molho de pimenta",
    category: "Temaki",
    subcategory: "",
    price: 25.00,
    imgUrl:
        "https://modelo-restaurante.auppi.com.br/wp-content/uploads/2021/03/temaki-hot-filadelfia-min.jpg",
    qty: 1,
  ),
  Product(
    id: 11,
    title: "Temaki Skin",
    description: "Arroz, salmão skin, pepino, cebolinha e gergelim",
    category: "Temaki",
    subcategory: "",
    price: 23.00,
    imgUrl:
        "https://www.djapa.com.br/blog/comida-japonesa/temaki-conheca-alguns-sabores-desta-iguaria-japonesa/attachment/temaki-salmao-skin/",
    qty: 1,
  ),
  Product(
    id: 12,
    title: "Temaki Salada",
    description:
        "Arroz, salmão cru, atum cru, pepino, cenoura, alface e gergelim",
    category: "Temaki",
    subcategory: "",
    price: 26.00,
    imgUrl:
        "https://img.cybercook.com.br/imagens/receitas/590/temaki-california.jpg",
    qty: 1,
  ),

  //Sobremesas
  Product(
    id: 13,
    title: "Tempura de banana",
    description:
        "Bananas empanadas e fritas, servidas com calda de mel e gergelim torrado",
    category: "Sobremesas",
    subcategory: "",
    price: 15.00,
    imgUrl:
        "https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/null/external-banana-tempura-asian-food-kiranshastry-lineal-color-kiranshastry.png",
    qty: 1,
  ),
  Product(
    id: 14,
    title: "Dorayaki",
    description: "Dois bolinhos macios recheados com doce de feijão azuki",
    category: "Sobremesas",
    subcategory: "",
    price: 12.00,
    imgUrl:
        "https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/null/external-dorayaki-asian-food-kiranshastry-lineal-color-kiranshastry.png",
    qty: 1,
  ),
  Product(
    id: 15,
    title: "Mochi",
    description:
        "Bolinho de massa de arroz glutinoso recheado com pasta de feijão azuki ou sorvete de matcha",
    category: "Sobremesas",
    subcategory: "",
    price: 8.00,
    imgUrl:
        "https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/null/external-mochi-asian-food-kiranshastry-lineal-color-kiranshastry.png",
    qty: 1,
  ),
  Product(
    id: 16,
    title: "Warabimochi",
    description:
        "Sobremesa gelatinosa feita de amido de batata doce e servida com açúcar e kinako (farinha de soja torrada)",
    category: "Sobremesas",
    subcategory: "",
    price: 10.00,
    imgUrl:
        "https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/null/external-mochi-japanese-food-kiranshastry-lineal-color-kiranshastry.png",
    qty: 1,
  ),
  Product(
    id: 17,
    title: "Anmitsu",
    description:
        "Cubos de gelatina de agar-agar, frutas, doce de feijão, mochi e calda de melado",
    category: "Sobremesas",
    subcategory: "",
    price: 18.00,
    imgUrl:
        "https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/null/external-japanese-sweets-anmitsu-kiranshastry-lineal-color-kiranshastry.png",
    qty: 1,
  ),

  //Bebidas
  Product(
    id: 18,
    title: "Água mineral (500ml)",
    description: "",
    category: "Bebidas",
    subcategory: "",
    price: 4.00,
    imgUrl:
        "https://img.icons8.com/external-wanicon-flat-wanicon/64/null/external-water-drink-wanicon-flat-wanicon.png",
    qty: 1,
  ),
  Product(
    id: 19,
    title: "Coca-Cola (lata 350ml)",
    description: "",
    category: "Bebidas",
    subcategory: "",
    price: 5.00,
    imgUrl:
        "https://img.icons8.com/external-wanicon-flat-wanicon/64/null/external-coke-soda-drink-wanicon-flat-wanicon.png",
    qty: 1,
  ),
  Product(
    id: 20,
    title: "Guaraná Antarctica (lata 350ml)",
    description: "",
    category: "Bebidas",
    subcategory: "",
    price: 5.00,
    imgUrl:
        "https://img.icons8.com/external-wanicon-flat-wanicon/64/null/external-guarana-drink-wanicon-flat-wanicon.png",
    qty: 1,
  ),
  Product(
    id: 21,
    title: "Fanta laranja (lata 350ml)",
    description: "",
    category: "Bebidas",
    subcategory: "",
    price: 5.00,
    imgUrl:
        "https://img.icons8.com/external-wanicon-flat-wanicon/64/null/external-orange-juice-drink-wanicon-flat-wanicon.png",
    qty: 1,
  ),
  Product(
    id: 22,
    title: "Sprite (lata 350ml)",
    description: "",
    category: "Bebidas",
    subcategory: "",
    price: 5.00,
    imgUrl:
        "https://img.icons8.com/external-wanicon-flat-wanicon/64/null/external-sprite-drink-wanicon-flat-wanicon.png",
    qty: 1,
  ),
  Product(
    id: 23,
    title: "Suco natural de laranja (500ml)",
    description: "",
    category: "Bebidas",
    subcategory: "",
    price: 8.00,
    imgUrl:
        "https://img.icons8.com/external-wanicon-flat-wanicon/64/null/external-orange-juice-juice-wanicon-flat-wanicon.png",
    qty: 1,
  ),
  Product(
    id: 24,
    title: "Suco natural de abacaxi (500ml)",
    description: "",
    category: "Bebidas",
    subcategory: "",
    price: 8.00,
    imgUrl:
        "https://img.icons8.com/external-wanicon-flat-wanicon/64/null/external-pineapple-juice-juice-wanicon-flat-wanicon.png",
    qty: 1,
  ),
  Product(
    id: 25,
    title: "Suco Natural de Laranja (500ml)",
    description:
        "Feito com laranjas frescas espremidas na hora, sem adição de açúcar.",
    category: "Bebidas",
    subcategory: "",
    price: 8.00,
    imgUrl:
        "https://img.icons8.com/external-flatart-icons-outline-flatarticons/64/000000/external-orange-juice-flatart-icons-outline-flatarticons.png",
    qty: 1,
  ),
  Product(
    id: 26,
    title: "Chá Gelado de Limão (500ml)",
    description: "Chá verde gelado com suco de limão e um toque de hortelã.",
    category: "Bebidas",
    subcategory: "",
    price: 6.00,
    imgUrl:
        "https://img.icons8.com/external-kiranshastry-solid-kiranshastry/64/000000/external-lemon-tea-summer-drink-kiranshastry-solid-kiranshastry.png",
    qty: 1,
  ),
  Product(
    id: 27,
    title: "Chá Gelado de Pêssego (500ml)",
    description: "Chá preto gelado com suco de pêssego e um toque de limão.",
    category: "Bebidas",
    subcategory: "",
    price: 6.00,
    imgUrl:
        "https://img.icons8.com/external-vitaliy-gorbachev-lineal-vitaly-gorbachev/64/000000/external-ice-tea-vitaliy-gorbachev-lineal-vitaly-gorbachev.png",
    qty: 1,
  ),
  Product(
    id: 28,
    title: "Saquê Nacional (180ml)",
    description: "Saquê nacional, servido quente ou frio.",
    category: "Bebidas",
    subcategory: "",
    price: 15.00,
    imgUrl:
        "https://img.icons8.com/external-flatart-icons-outline-flatarticons/64/000000/external-sake-japanese-culture-flatart-icons-outline-flatarticons.png",
    qty: 1,
  ),
  Product(
    id: 29,
    title: "Saquê Importado (180ml)",
    description: "Saquê importado, servido quente ou frio.",
    category: "Bebidas",
    subcategory: "",
    price: 25.00,
    imgUrl:
        "https://img.icons8.com/external-flatart-icons-outline-flatarticons/64/000000/external-sake-japanese-culture-flatart-icons-outline-flatarticons.png",
    qty: 1,
  ),
  Product(
    id: 30,
    title: "Cerveja Heineken (Long Neck - 330ml)",
    description: "Cerveja lager premium, leve e refrescante.",
    category: "Bebidas",
    subcategory: "Cervejas",
    price: 8.00,
    imgUrl: "https://img.icons8.com/color/64/000000/heineken.png",
    qty: 1,
  ),
  Product(
    id: 31,
    title: "Cerveja Stella Artois (Long Neck - 330ml)",
    description:
        "Cerveja premium lager de sabor equilibrado, amargor suave e notas frutadas e florais, com teor alcoólico de 5,2%",
    category: "Bebidas",
    subcategory: "Cervejas",
    price: 8.00,
    imgUrl:
        "https://www.donchefe.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/t/stella-330ml.jpg",
    qty: 1,
  ),
  Product(
    id: 32,
    title: "Cerveja Corona (Long Neck - 355ml)",
    description:
        "Cerveja pilsner de origem mexicana, refrescante e leve, com um toque cítrico e de malte. Teor alcoólico: 4,6%",
    category: "Bebidas",
    subcategory: "Cervejas",
    price: 10.00,
    imgUrl:
        "https://www.saboresmexicanos.com.br/image/cache/catalog/produtos/Cervejas/Corona-355ml-01-800x800.jpg",
    qty: 1,
  ),

  //Molhos
  Product(
    id: 33,
    title: "Shoyu",
    description: "Molho de soja fermentada e salgada",
    category: "Molhos",
    subcategory: "",
    price: 2.00,
    imgUrl: "https://img.icons8.com/dusk/64/000000/soy-sauce.png",
    qty: 1,
  ),
  Product(
    id: 34,
    title: "Tare",
    description: "Molho a base de shoyu, saquê, açúcar e temperos",
    category: "Molhos",
    subcategory: "",
    price: 3.00,
    imgUrl: "https://img.icons8.com/dusk/64/000000/soy-sauce.png",
    qty: 1,
  ),
  Product(
    id: 35,
    title: "Wasabi",
    description: "Pasta de raiz forte japonesa",
    category: "Molhos",
    subcategory: "",
    price: 4.00,
    imgUrl: "https://img.icons8.com/external-justicon-flat-justicon/64/000000/external-wasabi-food-justicon-flat-justicon.png",
    qty: 1,
  ),
  Product(
    id: 36,
    title: "Gari",
    description: "Conserva de gengibre",
    category: "Molhos",
    subcategory: "",
    price: 2.00,
    imgUrl: "https://img.icons8.com/external-justicon-flat-justicon/64/000000/external-ginger-food-justicon-flat-justicon.png",
    qty: 1,
  ),

];
class SelectedProductsPage extends StatelessWidget {
  final List<Product> selectedProducts = [];

  SelectedProductsPage({super.key}) {
    // Adicionando somente produtos com ids 1, 2, 4, 6 e 9
    selectedProducts.addAll(products.where((product) => [1, 2, 4, 6, 9].contains(product.id)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
