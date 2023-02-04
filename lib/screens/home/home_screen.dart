import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 10.0,bottom: 0.0),
          child: Container(
            color: Colors.grey.shade200,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,          
              children: [
                Image.asset('assets/images/pgu design.png',width: double.infinity,height: 80,),
                SizedBox(height: 80,),
                Text("THIS PAGE IS UNDER CONSTRUCTION !!",style: TextStyle(fontSize: 20),),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}