import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/screens/settings.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController pass0Controller = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();

  bool _obsecureText = true;

  String pass1 = "";
  String pass2 = "";
  String pass0 = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade300,
        title: Text("Change Password",style: TextStyle(color: Colors.black87),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\tCurrent Password",style: TextStyle(fontSize: 18,color: Colors.black87),),
                      SizedBox(height: height * 0.006,),
                      Container(
                        height: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: pass0Controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 8 || value.length > 32) {
                              return "Enter the password range between 8 to 32 letters";
                            } else if (RegExp(r'[\s]').hasMatch(value)) {
                              return "Password does not contain white spaces";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon( _obsecureText ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState( () { _obsecureText = !_obsecureText; },);
                              },
                            ),
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
                            hintText: "Current Password",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                      ),
                      SizedBox(height: height * 0.008,),
                      Text("\tNew Password",style: TextStyle(fontSize: 18,color: Colors.black87),),
                      SizedBox(height: height * 0.006,),
                      Container(
                        height: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: pass1Controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 8 || value.length > 32) {
                              return "Enter the password range between 8 to 32 letters";
                            } else if (RegExp(r'[\s]').hasMatch(value)) {
                              return "Password does not contain white spaces";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon( _obsecureText ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState( () { _obsecureText = !_obsecureText; },);
                              },
                            ),
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
                            hintText: "Enter New Password",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                      ),
                      SizedBox(height: height * 0.008,),
                      Text("\tConfirm Password",style: TextStyle(fontSize: 18,color: Colors.black87),),
                      SizedBox(height: height * 0.006,),
                      Container(
                        height: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: pass2Controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 8 || value.length > 32) {
                              return "Enter the password range between 8 to 32 letters";
                            } else if (RegExp(r'[\s]').hasMatch(value)) {
                              return "Password does not contain white spaces";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon( _obsecureText ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState( () { _obsecureText = !_obsecureText; },);
                              },
                            ),
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
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                      ),
                      SizedBox(height: height * 0.1,),
                      Center(child: ElevatedButton(onPressed: (){}, child: Text("Update Password")))
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
 /*
  Future<void> _changepass() async {
    try {
      // final image = await ImagePicker().pickImage(source: ImageSource.camera);
      // if (image == null) return;
      // final imageSelect = File(image!.path);
      // this.image = imageSelect;
      // print(image);
      // if (user == null) {
      //   // print("exist");
      // } else {
      //   final ref = FirebaseStorage.instance
      //       .ref()
      //       .child('userimages')
      //       .child(name + '.jpg');
      //   await ref.putFile(this.image!);
      //   String url = await ref.getDownloadURL();
      //   print(url);
      final password

        try {
          final user = auth.currentUser!.uid;
          print("user id=> $user");
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user)
              .update({"imageurl": url});
          // getUserData();
        } on FirebaseException catch (error) {
          print(error.code);
        }
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: e.code);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }*/
  /*
  Future<void> _changepass() async {
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
  }
  */
}