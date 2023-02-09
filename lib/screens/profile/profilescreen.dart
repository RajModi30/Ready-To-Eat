import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/screens/home/BottomNavigation.dart';
import 'package:shoppuneet/screens/login.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  // File? image2;
  String photo = "";
  /* int activeIndex = 0;
  int index = 0;
  int selected = 0;

  void changeSelected(int index) {
    setState(() {
      selected = index;
    });
  }*/ 
  //  drawer mate 

void initState() {
    // isButton = false;
    getUserData();
    // pickImage();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
  /*    drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              selected: selected == 0,
              leading: const Icon(Icons.person),
              title: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                changeSelected(0);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            }),
            ListTile(
              selected: selected == 1,
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text(
                "Orders",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: (() => changeSelected(1))
            ),
            ListTile(
              selected: selected == 2,
              leading: const Icon(Icons.info_outline),
              title: const Text(
                "About",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: (() => changeSelected(2))
            ),
            ListTile(
              selected: selected == 3,
              leading: const Icon(Icons.help_outline),
              title: const Text(
                "Help",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                changeSelected(3);
              },
            ),
            ListTile(
                selected: selected == 4,
                leading: const Icon(Icons.logout_rounded),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  changeSelected(4);
                  signout();
                })
          ],
        ),
      ),
    */  
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(color: Colors.black87),),
        // centerTitle: true,
        backgroundColor: Colors.amber.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Center(
              child: Column(
                children: [
                  image==null?
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.05,
                    // width: MediaQuery.of(context).size.width * 0.15,
                    height: 100,
                    width: 100,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // color: Colors.red,
                      image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.fill)
                    ),
                  ):CircularProgressIndicator(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked");
                    },
                    child: GestureDetector(
                      onTap: () {
                        print("clicked");
                        pickImage();  
                      },
                      child: Text(
                        "Change Photo",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            // Text("Tap above to update your profile picture",style: TextStyle(fontSize: 14,color: Colors.grey[400]),),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            Divider(
              thickness: 3,
              color: Colors.grey[650],
            ),
            // Text("hello")
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              child: Center(
                child: Text("This page is Under Construction !! \n Thanks for your support")
              )
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
       final image = await ImagePicker().pickImage(source: ImageSource.camera);
      // if (image == null) return;
      final imageSelect = File(image!.path);
      this.image = imageSelect;
      print(image);
      if (user == null) {
        // print("exist");
      } else {
        final ref = FirebaseStorage.instance
            .ref()
            .child('userimages');
            // .child(name + '.jpg');
        await ref.putFile(this.image!);
        String url = await ref.getDownloadURL();
        print(url);

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
  }

  Future<void> getUserData() async {
    // final uid=GoogleButton().authResult.user
    // if (user == null) {
    //   print("user is not exist");
    // } else {
      
      try {
        final user = auth.currentUser!.uid;
        final DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user)
            .get();
        print(user);
        // id=userDoc.get('id');
        setState(() {
          photo = snapshot.get('imageurl');
          print(photo);
        });
      } on FirebaseException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
    // }
  }

/*  void signout() async {
    final googleAccount = GoogleSignIn();
    googleAccount.signOut();
    print("normal email signout $uid");
    await auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MyLogin())));
  }*/
}