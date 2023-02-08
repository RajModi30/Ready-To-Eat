import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Categories",style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.amber[300],
        elevation: 0,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("This page is Under Construction !! \n Thanks for your support"))
        ],
        // width: double.infinity,
        // height: double.infinity,
        // color: Colors.deepOrange,
      ));
  }
}