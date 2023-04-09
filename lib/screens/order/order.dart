import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/models/category.dart';
import 'package:shoppuneet/providers/cartservice.dart';
import 'package:shoppuneet/providers/carttotal.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/models/cartitem.dart';
import 'package:shoppuneet/models/category.dart';
import 'package:provider/provider.dart';
// import '../models/utils.dart';
import '/models/utils.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}


class _OrderScreenState extends State<OrderScreen> {

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    CartService c2 = Provider.of<CartService>(context, listen: false);
    List<Category_item> categories = Utils.getMockedcategories();
    print("item count::::${categories.length}");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade300,
        title: Text("Your Orders",style: TextStyle(color: Colors.black87),),
        iconTheme: IconThemeData(color: Colors.black),),
      body: SafeArea(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: categories.length,
          // itemBuilder: (context, index) {
          //   
          // },
            itemBuilder: ((BuildContext context, int index) =>
              Consumer<CartService>(builder: (context, c2, child) {
            // List<Widget> cartitems=[];
            List<CartItem> c1 = c2.items;
            Product p1 = c1[index].category;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      // height: 100,
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
                                        // Row(
                                        //   children: [
                                        //     Text("Product Qty : "),
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     // Text(p1.q1),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      // child: Text(
                      //   categories[index].title
                      // ),
                    ),
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
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 2),
    )));
  }
}