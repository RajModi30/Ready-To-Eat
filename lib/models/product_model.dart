import 'package:get/get.dart';
import 'package:shoppuneet/models/category.dart';

class CartController extends GetxController{
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] +=1 ;
    } else {
      _products[product] = 1;
    }
  }
}