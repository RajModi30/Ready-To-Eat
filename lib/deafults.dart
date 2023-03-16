import 'dart:async';
import 'package:provider/provider.dart';
import 'package:shoppuneet/firebase/auth.dart';
// import 'package:shoppuneet/screens/home/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/models/category.dart';
import 'package:shoppuneet/models/utils.dart';
import 'package:shoppuneet/providers/categoryselectionservice.dart';
import 'package:shoppuneet/screens/home/home_screen.dart';
import 'package:shoppuneet/screens/login.dart';
import 'package:shoppuneet/screens/selectcategory.dart';



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

class Demo {
  String Namkeen = "assets/images/items/namkeen1.png";
  String Popcorn = "assets/images/slide/popcorn.png";
  String Sikandar_Peanuts = "assets/images/items/MASALA SING new.png";
  String Sikandar_Chana = "assets/images/items/sikandar new.png";
  String Biscuit = "assets/images/items/chakri/bis.png";

  String namkeen_kachori = "assets/images/items/chakri/1 dry fruit kachori.png";
  String namkeen_chanajor = "assets/images/items/chakri/1 chanajor.png";
  String namkeen_fulvadi = "assets/images/items/chakri/fulvadi.png";
  String namkeen_naylonsev = "assets/images/items/chakri/nay lon 1.png";
  String soya_sticks = "assets/images/items/chakri/soya stick.png";
  String soya_chips = "assets/images/items/chakri/soya chips 2.png";
  // String  = "assets/images/items/chakri/nay lon 1.png";
  
  // String fruits_mango = "assets/images/fruits/mango.png";
  // String fruits_strawberry = "assets/images/fruits/strawberry.png";

  String popcorn_cheese = "assets/images/items/popcorn/cheese.png";
  String popcorn_butter = "assets/images/items/popcorn/butter salted.png";
  String popcorn_cheedar = "assets/images/items/popcorn/cheedar cheese.png";
  String popcorn_garlic = "assets/images/items/popcorn/garlic.png";
  String popcorn_schezwan = "assets/images/items/popcorn/schezwan.png";
  String popcorn_regular = "assets/images/items/popcorn/turmi masala.png";
  
  String sikandar_peanuts_vc200 = "assets/images/items/chakri/vc200.png";
  String sikandar_peanuts_vc500 = "assets/images/items/chakri/vc500.png";
  String sikandar_peanuts_hf150 = "assets/images/items/chakri/hf150.png";
  String sikandar_peanuts_hf500 = "assets/images/items/chakri/hf150.png";
  String sikandar_peanuts_np_masala = "assets/images/items/chakri/nimboo_peanuts.png";

  String sikandar_chana_salted = "assets/images/items/chakri/SCfs.png";
  String sikandar_chana_mora = "assets/images/items/chakri/MCfs.png";
  String sikandar_chana_hfsalted = "assets/images/items/chakri/FKfs.png";
  String sikandar_chana_hfmora = "assets/images/items/chakri/FMfs.png";
  String siknadar_chana_bp_masala = "assets/images/items/chakri/bp_chana.png";
  
  String biscuit_karachi = "assets/images/items/chakri/karachi_fruit_1.png";
  String biscuit_pista_karachi = "assets/images/items/chakri/pista.png";
  String biscuit_dd_karachi = "assets/images/items/chakri/dd_karachi.png";
  String biscuit_osmania_karachi = "assets/images/items/chakri/osmania_karachi.png";
  String biscuit_cc_karachi = "assets/images/items/chakri/cc_karachi.png";
  String biscuit_cashew_karachi = "assets/images/items/chakri/cashew_karachi.png";
  /*
  String beverages_coffee = "assets/images/beverages/coffee.png";
  String beverages_hell = "assets/images/beverages/hell.png";
  String beverages_juices = "assets/images/beverages/mango juice.png";
  String beverages_milk = "assets/images/beverages/milk.png";
  String beverages_tea = "assets/images/beverages/tea.png";
  String beverages_water = "assets/images/beverages/water.png";
  */
}