import "package:flutter/material.dart";
import 'package:shoppuneet/deafults.dart';


Demo d1 = Demo();

class Category_item {
  String image;
  Color c1;
  Color c2;
  String title;
  Function onTap;
  List<Product> subcategory;
  Category_item({
    required this.image,
    required this.c1,
    required this.c2,
    required this.title,
    required this.onTap,
    required this.subcategory,
  });
}

class Product {
  String title;
  String price;
  String image;
  List<ProductDetails> productSubCategory;
  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.productSubCategory,
  });
}

class ProductDetails {
  Color c1;
  Color c2;
  String decription;
  List<CartDetails> cartCategory;

  ProductDetails({
    required this.c1,
    required this.c2,
    required this.cartCategory,
    required this.decription,
  });
}

class CartDetails {
  int product_price;
  String unit;
  CartDetails({
    // ignore: non_constant_identifier_names
    required this.product_price,
    required this.unit,
  });
}
