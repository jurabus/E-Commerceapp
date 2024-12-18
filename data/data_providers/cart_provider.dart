import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> cartList = [];
  double totalPrice = 0;
  void addToCart(
      {required String title, required String imageUrl, required var price}) {
    Map<String, dynamic> cartItem = {
      'title': title,
      'image': imageUrl,
      'price': price
    };
    cartList.add(cartItem);
    totalSum();

    notifyListeners();
  }

  void removeFromCart({required int index}) {
    cartList.removeAt(index);
    totalSum();
    notifyListeners();
  }

  void totalSum() {
    totalPrice = 0;
    for (var item in cartList) {
      totalPrice += item['price'];
    }
    notifyListeners();
  }
}
