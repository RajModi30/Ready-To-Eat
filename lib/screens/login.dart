import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/deafults.dart';
import 'package:shoppuneet/firebase/auth.dart';
// import 'package:shoppuneet/screens/home/BottomNavigation.dart';
import 'dart:async';

import 'package:shoppuneet/screens/home/home_screen.dart';
import 'package:shoppuneet/screens/forgot.dart';
import 'package:shoppuneet/screens/register.dart';

class MyLogin extends StatefulWidget {
  // const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _MyLoginState extends State<MyLogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  
  String password = "";
  String email = "";

  bool _obsecureText = true;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 35, top: 200),
                child: Text(
                  'Welcome',
                  style: TextStyle(fontFamily: 'Alex', color: Colors.white, fontSize: 40),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
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
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: Colors.black54,
                                    size: 30,
                                  ),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter password";
                                } else if (value.length < 8 || value.length > 32) {
                                  return "Enter the password range between 8 to 32";
                                } else if (RegExp(r'[\s]').hasMatch(value)) {
                                  return "Password does not contain white spaces";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(),
                              obscureText: _obsecureText,
                              keyboardType: TextInputType.text,
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
                                prefixIcon : Icon(
                                  Icons.lock,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            /*  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27, fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {onSignIN();},
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ), */
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: ElevatedButton(
                                onPressed: () {
                                  onSignIN();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.amber[400]),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  textStyle: MaterialStateProperty.all(TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50))),
                                ),
                                child: Text("SIGN-IN"),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 4,
                                    indent: 0,
                                    endIndent: 5,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  "OR",
                                  style:
                                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 4,
                                  indent: 5,
                                  endIndent: 0,
                                  color: Colors.black54,
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            GoogleButton(),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(context, 'register');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyRegister()));
                                  },
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Forgot()));
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
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

  void onSignIN() async {
    if (_formKey.currentState!.validate()) {
      try {
        final authresult = await auth.signInWithEmailAndPassword(
            email: emailController.text.toLowerCase().trim(),
            password: passController.text.trim());

        Fluttertoast.showToast(msg: "Logged IN",gravity: ToastGravity.BOTTOM,backgroundColor: Colors.green.shade600);
        // Timer(Duration(seconds: 3), () { });
        Fluttertoast.showToast(msg: "Warning : Once you add item in your cart you can't remove it ! \nBe careful when you add item",gravity: ToastGravity.CENTER,toastLength: Toast.LENGTH_LONG
        );

        Timer(
            Duration(seconds: 2),
        
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => HomeScreen()))));

        print("success ${authresult.user!.uid}");
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      }
    }
  }
}
