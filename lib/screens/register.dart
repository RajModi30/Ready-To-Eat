// import 'package:shoppuneet/deafults.dart';


import 'package:shoppuneet/firebase/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:shoppuneet/screens/login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneContoller = TextEditingController();

  String password = "";
  String email = "";
  String name = "";
  String phone = "";

  bool _obsecureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Name controller
                            TextFormField(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.white),
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter name";
                                } else if (!RegExp(r'[\a-zA-Z]+$').hasMatch(value)) {
                                  return "Enter valid name";
                                } else if (value.length < 6 || value.length > 20) {
                                  return "Enter the name between 6 to 20 letters";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  // prefixIcon : Icon(
                                  //   Icons.account_circle_outlined,
                                  //   color: Colors.black54,
                                  //   size: 30,
                                  // ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Email Controller
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter email";
                                } else if (!EmailValidator.validate(value)) {
                                  return "Enter valid email";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  // prefixIcon: Icon(
                                  //   Icons.person_outline,
                                  //   color: Colors.black54,
                                  //   size: 30,
                                  // ),
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Password Controller
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: passController,
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
                              style: TextStyle(color: Colors.white),
                              obscureText: _obsecureText,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obsecureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(
                                        () {
                                          _obsecureText = !_obsecureText;
                                        },
                                      );
                                    },
                                  ),
                                  // prefixIcon : Icon(
                                  //   Icons.lock,
                                  //   color: Colors.black54,
                                  //   size: 30,
                                  // ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            // Phone number controller
                            TextFormField(
                              // textInputAction: TextInputAction.next,
                              controller: phoneContoller,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your phone number";
                                // } else if (!EmailValidator.validate(value)) {
                                } else if (value.length!=10) {
                                  return "Enter valid phone number";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Phone number",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            // TextFormField(
                            //   controller: addressController,
                            //   textInputAction: TextInputAction.next,
                            //   style: TextStyle(color: Colors.white),
                            //   obscureText: false,
                            //   keyboardType: TextInputType.text,
                            //   validator: (value) {
                            //     if (value!.isEmpty) {
                            //       return "Enter address";
                            //     } else if (!RegExp(r'[\a-zA-Z]+$').hasMatch(value)) {
                            //       return "Enter valid name";
                            //     } else if (value.length < 6 || value.length > 20) {
                            //       return "Enter whole address";
                            //     } else {
                            //       return null;
                            //     }
                            //   },
                            //   decoration: InputDecoration(
                            //       // prefixIcon : Icon(
                            //       //   Icons.account_circle_outlined,
                            //       //   color: Colors.black54,
                            //       //   size: 30,
                            //       // ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //         borderSide: BorderSide(
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //         borderSide: BorderSide(
                            //           color: Colors.black,
                            //         ),
                            //       ),
                            //       hintText: "address",
                            //       hintStyle: TextStyle(color: Colors.white),
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //       )),
                            // ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black12)
                            //   ),
                            //   child: Text("By click on Sign Up botton \nyou agreed our Terms & Conditions",style: TextStyle(color: Colors.black45),),
                            // ),
                            // SizedBox(
                            //   height: 40,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        onSignUP();
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSignUP() async {
    // final user=auth.currentUser;
    // final uid=user!.uid;

    if (_formKey.currentState!.validate()) {
      try {
        print("registered");
        String _default =
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9OIEewQ6injKiEC0aDlOt3r7Q8Wf7bEeyK_bYtE4wSjcw1QmyHY-dLNM7Vk46Dp82l_o&usqp=CAU";

        final authresult = await auth.createUserWithEmailAndPassword(
            email: emailController.text.toLowerCase().trim(),
            password: passController.text.trim());
        final uid = authresult.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'id': uid,
          'name': nameController.text,
          'email': emailController.text.toLowerCase().trim(),
          'password' : passController.text.trim(),
          'imageurl': _default,
          'phone' : phoneContoller.text,
          'createdAt': Timestamp.now()
        }, SetOptions(merge: true));
        print("success $uid");
        Fluttertoast.showToast(
          msg: "Successfully Registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green.shade600,
        );

        Timer(
            const Duration(seconds: 3),
            () => Navigator.push(
                context, MaterialPageRoute(builder: ((context) => MyLogin()))));
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
}
