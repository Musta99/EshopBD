import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gajetbd/constant/API_Integration.dart';
import 'package:gajetbd/constant/productsclass.dart';
import 'package:http/http.dart';

class ProviderState extends ChangeNotifier {
  List<Products> _items = [];
  List<Products> _cartItems = [];
  String _title = '';
  String _image = "";
  String _details = '';
  String _category = '';
  double? _price;
  ApiIntegration apiIntegration = ApiIntegration();

  List<Products> get getProductItems => _items;
  List<Products> get getCartItems => _cartItems;
  String get gettitle => _title;
  String get geImage => _image;
  String get geDetails => _details;
  String get getPrice => _price.toString();
  String get getCategory => _category;

  Future fetchProducts() async {
    _items = await apiIntegration.fetchProducts();
    notifyListeners();
  }

  void productDetails(index) {
    _title = getProductItems[index].title!;
    _image = getProductItems[index].image!;
    _details = getProductItems[index].description!;
    _price = getProductItems[index].price!;
    _category = getProductItems[index].category!;
  }

  void addtoCart(items) {
    _cartItems.add(items);
    notifyListeners();
  }

  void removeFromCart(itemsr) {
    _cartItems.remove(itemsr);
    notifyListeners();
  }
}
