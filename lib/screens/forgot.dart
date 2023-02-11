import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/firebase/auth.dart';
// import 'package:shoppuneet/screen/declare.dart';
// import 'package:shoppuneet/screen/widget.dart';

class Forgot extends StatelessWidget {
  void dispose() {
    emailController.dispose();
  }

  
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
          elevation: 0,),
        // backgroundColor: Color.fromARGB(255,255,255,255),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 50),
                    // Container(
                    //   // decoration : BoxDecoration(
                    //   //   image: DecorationImage(image: AssetImage('assets/images/ready to eat.png'),fit: BoxFit.contain)
                    //   // )
                    //   child: Image(image: AssetImage('assets/images/ready to eat.png')),
                    // ),
                    // Container(
                    //   height: 120,
                    //   width: 120,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(50),
                    //     image: DecorationImage(image: AssetImage('assets/images/ready to eat.png'), fit: BoxFit.contain)
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset('assets/images/ready to eat.png',fit: BoxFit.fill,),
                      ),
                      radius: 71.58,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.always,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.black54,
                              size: 30,
                            ),
                            hintText: "Enter Email",
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),)
                          ),
                          
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          // Icon: Icon(
                          //   Icons.person,
                          //   // color: d1.icon_color,
                          //   // size: d1.icon_size,
                          // ),
                          // autovalidateMode: AutovalidateMode.disabled,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email";
                            } else if (!EmailValidator.validate(value)) {
                              return "Enter valid email";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            onForgot();
                          },
                          child: Text("Reset Password"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)))),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("SIGN-IN",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.forward_rounded, size: 40),
                              backgroundColor: Colors.amber,
                            )
                          ],
                        ),
                      ),
                    ),
                  ])),
              ])),
          )),
    );
  }

  void onForgot() async {
    if (formkey.currentState!.validate()) {
      try {
        // final currentUser=auth.currentUser!;
        await auth.sendPasswordResetEmail(
            email: emailController.text.toLowerCase().trim());
        print("uid" + uid);
        Fluttertoast.showToast(msg: "Reset password link sent");
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      }
    }
  }
}
