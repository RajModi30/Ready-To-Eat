import 'dart:async';
import 'package:shoppuneet/firebase/auth.dart';
// import 'package:shoppuneet/screens/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/home/home_screen.dart';



class GoogleButton extends StatefulWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  Future<void> google_sign_in(context) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authresult = await auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          final uid = authresult.user!.uid;
          print(uid);

          if (authresult.additionalUserInfo!.isNewUser) {
            await FirebaseFirestore.instance.collection('users').doc(uid).set({
              'id': uid,
              'name': auth.currentUser!.displayName,
              'email': auth.currentUser!.email,
              'imageurl': auth.currentUser!.photoURL,
              'createdAt': Timestamp.now()
            });
          } else {
            print("already created $uid");
          }
          Navigator.pushReplacement(context,
              // MaterialPageRoute(builder: ((context) => BottomNavigation())));
              MaterialPageRoute(builder: ((context) => HomeScreen())));
        } on FirebaseException catch (error) {
          Fluttertoast.showToast(msg: error.code);
        } catch (error) {
          Fluttertoast.showToast(msg: error.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        google_sign_in(context);
        print("clicked");
      },
      child: Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.grey),
              boxShadow: [BoxShadow(color: Colors.white)]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/google.png'),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Continue with Google",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }
}