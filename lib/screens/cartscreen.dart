import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/models/cartitem.dart';
import 'package:shoppuneet/models/category.dart';
import 'package:shoppuneet/providers/cartservice.dart';
import 'package:provider/provider.dart';
import 'package:shoppuneet/screens/order/order.dart';
import '../models/utils.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    // Text("hello");
  }

  String category = "";
  String item = "";
  String rate = "";

  @override
  Widget build(BuildContext context) {
    CartService c2 = Provider.of<CartService>(context, listen: false);
    List<Category_item> categories = Utils.getMockedcategories();
    // print("item count::::${categories.length}");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber.shade300,
          title: Text(
            "Check Out",
            style: TextStyle(color: Colors.black87),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    // shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: categories.length,
                          // itemBuilder: (context, index) {
                          // },
                          itemBuilder: ((BuildContext context, int index) =>
                    Consumer<CartService>(builder: (context, c2, child) {
                      // List<Widget> cartitems=[];
                      List<CartItem> c1 = c2.items;
                      Product p1 = c1[index].category;
                      return SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.amber,
                                // height: 100,
                                child: Container(
                                  color: Colors.amber,
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              p1.image,
                                              height: 50,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Product Name:"),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(p1.title),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text("Price:"),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(p1.price),
                                                ],
                                              ),
                                              // Row(
                                              //   children: [
                                              //     Text("Product Qty : "),
                                              //     SizedBox(
                                              //       width: 5,
                                              //     ),
                                              //     // Text($q1),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                
                              
                              // SizedBox(height: MediaQuery.of(context).size.height * 0.35,),
                            ],
                          ),
                        ),
                      );
                      /*
                  if (c2.items.isEmpty) {
                    print("is empty");
                    return Text("is empty");
                  } else {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.amber,
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      p1.image,
                                      height: 50,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Product Name:"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(p1.title),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Price:"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(p1.price),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Product Qty : "),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          // Text("$q1"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } */
                    })),
                          separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 2),
                        ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
              ElevatedButton(
                onPressed: () async {
                  _placeOrder();
                },
                child: Text('Place Order')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ],
            )));
  }

  Future<void> _placeOrder() async {
    // // FirebaseFirestore.instance.collection("orders").doc();
    // final user = FirebaseAuth.instance.currentUser;
    // await FirebaseFirestore.instance.collection('orders').doc(user?.uid).collection("orders").add({
    //   'id': 1,
    //   'Item-Name': 
    //   'item-Category': "$category",
    //   'rate' : ,
    //   'orderedAt': Timestamp.now()                
    // }).then((value) => print('$value'));
    // //  print("success $uid");
    Fluttertoast.showToast(
      msg: "Thanks For placing your order!\nWe will deliver it very quickly!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green.shade600,
    );

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => OrderScreen()))));
    // } on FirebaseAuthException catch (error) {
    //   print("Error occured ${error.message}");
    //   Fluttertoast.showToast(
    //       msg: error.code,
    //       toastLength: Toast.LENGTH_SHORT,
    //       backgroundColor: Colors.black,
    //       fontSize: 20);
    // } catch (error) {
    //   Fluttertoast.showToast(
    //       msg: error.toString(),
    //       toastLength: Toast.LENGTH_SHORT,
    //       backgroundColor: Colors.black,
    //       fontSize: 20);
    // }
  }
  /*
  CollectionReference cartData = FirebaseFirestore
  .instance
  .collection('cartData')
  .doc(user?.email)
  .collection("cart");
  String cartId = '';

  Future<void> addToCart() {
    // Call the user's CollectionReference to add a new user
    return cartData.add({
      'user_id': '$user',
      //Here Add current User Id
      'product_id': '$CartScreen()'
      //Here Add product Id which is to be added in cart,
    }).then((value) {
      print("Product Added to cart");
      cartId = value.id;
    }).catchError((error) => print("Failed to add product: $error"));
  }

  getCartData() async {
    List cartList = [];
    final getCartData = await cartData.get();
    final cartId = [];
    getCartData.docs.forEach((element) {
      cartId.add(element.id);
    });
    print(cartId);
    for (int i = 0; i < cartId.length; i++) {
      cartList.add(
        await cartData.doc(cartId[i]).get().then(
              (snapshot) => snapshot.data(),
            ),
      );
    }
    print(cartList);
  }*/
}