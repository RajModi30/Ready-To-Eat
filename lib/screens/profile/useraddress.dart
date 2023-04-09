import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/screens/settings.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController addline1 = TextEditingController();
  TextEditingController addline2 = TextEditingController();
  TextEditingController addline3 = TextEditingController();
  TextEditingController addline4 = TextEditingController();
  TextEditingController addline5 = TextEditingController();
  
  String address_line_1 = "";
  String address_line_2 = "";
  String address_line_3 = "";
  String address_line_4 = "";
  String address_line_5 = "";
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade300,
        title: Text("Add your Address",style: TextStyle(color: Colors.black87),),
        iconTheme: IconThemeData(color: Colors.black),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        controller: addline1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your address";
                          } else if (value.length < 6 || value.length > 32) {
                            return "Enter your address between 8 to 32 letters";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide( color: Colors.black87,),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintText: "House / Flat / Block NO.",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                            
                      ),
                      SizedBox(height: height*0.03,),
                      Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: addline2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your address";
                            } else if (value.length < 6 || value.length > 50) {
                              return "Enter your address between 8 to 50 letters";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide( color: Colors.black87,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Apartment / Road / Area",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                              
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: addline3,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your city";
                            } else if (value.length < 6 || value.length > 32) {
                              return "Enter your city";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide( color: Colors.black87,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintText: "City",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                              
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: addline4,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter valid state name";
                            } else if (value.length < 6 || value.length > 32) {
                              return "Enter valid state name";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide( color: Colors.black87,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintText: "state",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                              
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          controller: addline5,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your area pincode";
                            } else if (value.length != 6) {
                              return "Enter valid pincode";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide( color: Colors.black87,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Enter Pincode",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                              
                        ),
                      ),
                      SizedBox(height: height*0.05,),
                      ElevatedButton(
                        onPressed: () {
                          
                          onSignUP();
                        }, 
                        child: Text('Add Address',style: TextStyle(color: Colors.amber),)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSignUP() async {
    if (_formKey.currentState!.validate()) {
      try {

    final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('user-addresses').doc(user?.uid).collection("address").add({
        'id': 1,
        'address_line_1': addline1.text,
        'address_line_2': addline2.text,
        'address_line_3' : addline3.text,
        'address_line_4': addline4.text,
        'address_line_5' : addline5.text,
        'createdAt': Timestamp.now()                                                      
      },);
      Fluttertoast.showToast(
        msg: "Address Successfully Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey.shade600,
      );

      Timer(
        const Duration(seconds: 3),
        () => Navigator.pop(
          context, MaterialPageRoute(builder: ((context) => SettingPage()))));
    } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      }
    }
    /*
    if (_formKey.currentState!.validate()) {
      try {
        print("registered");
        
        final authresult = await auth.createUserWithEmailAndPassword(
            email: emailController.text.toLowerCase().trim(),
            password: passController.text.trim()
          );
        final uid = authresult.user!.uid;
        await FirebaseFirestore.instance.collection('users-address').doc(uid).set({
          'id': uid,
          'address_line_1': addline1.text,
          'address_line_2': addline2.text,
          'address_line_3' : addline3.text,
          'address_line_4': addline4.text,
          'address_line_5' : addline5.text,
          'createdAt': Timestamp.now()
        }, SetOptions(merge: true));
        print("success $uid");
        Fluttertoast.showToast(
          msg: "Address Successfully Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade600,
        );

        Timer(
            const Duration(seconds: 3),
            () => Navigator.pop(
                context, MaterialPageRoute(builder: ((context) => SettingPage()))));
      } on FirebaseAuthException catch (error) {
        print("Error occured ${error.message}");
        Fluttertoast.showToast(
            msg: error.code,
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black,
            fontSize: 20);
      } catch (error) {
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black,
            fontSize: 20);
      }
    }
  }
  */
  }
}