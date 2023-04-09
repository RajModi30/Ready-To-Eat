import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shoppuneet/models/cartitem.dart';
import 'package:shoppuneet/models/category.dart';

class CartService extends ChangeNotifier{
  final List<CartItem> _items=[];
  List<CartItem> get items=>(_items);

  void add(CartItem item){
    items.add(item);
    notifyListeners();
  }

  void remove(CartItem item){
    items.remove(item);
    notifyListeners();
  }

  bool isSubProductAddedToCart(Product product){
    return _items.length>0 ? _items.any((CartItem item) => item.category.title==product.title):false;
  }

}