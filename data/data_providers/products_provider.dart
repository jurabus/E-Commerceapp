import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<dynamic> productsList = [];
  bool isLoading = true;
  Future<void> getData() async {
    try {
      Response response = await Dio().get('https://fakestoreapi.com/products');
      productsList = response.data;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
