import 'package:flutter/material.dart';
import 'package:http/http.dart';


import 'Item.dart';
class Cardd with ChangeNotifier {


  List selectedproducts = [];
  int price=0;

  add(Item product) {
    selectedproducts.add(product);

    price+= product.price.ceil();
    notifyListeners();


  }

  delete(Item product) {
    selectedproducts.remove(product);

    price-= product.price.ceil();
    notifyListeners();
  }
}