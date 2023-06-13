import 'package:scoped_model/scoped_model.dart';
import 'package:kyoto_express/Loja/product_list.dart';
class CartModel extends Model {
  List<Product> cart = [];
  double totalCartValue = 0;
  String cartItens= '';

  int get total => cart.length;

  void addProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    //print(index);
    if (index != -1) {
      updateProduct(product, product.qty + 1);
    } else {
      cart.add(product);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0) {
      removeProduct(product);
    }

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    for (var f in cart) {
      f.qty = 1;
    }
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    for (var f in cart) {
      totalCartValue += f.price * f.qty;
    }
  }
  void stringCart() {
    var cartItens= '';
    for (var f in cart) {
      cartItens += '${f.title} (${f.qty}), ';
    }

    // Remover a vírgula extra no final, se houver itens no carrinho
    if (cartItens.isNotEmpty) {
      cartItens = cartItens.substring(0, cartItens.length - 2);
    }
  }
}

