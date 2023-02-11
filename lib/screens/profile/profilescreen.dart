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
import 'package:shoppuneet/screens/profile/update.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  var name="";
  // File? image2;
  String photo = "";
  String email = "";
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  image==null?
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                  Text("Tap to change your profile picture",style: TextStyle(fontSize: 14,color: Colors.grey[400]),),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
            ),
            Divider(
              thickness: 1.2,
              color: Colors.grey[650],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text("Name : ",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.003,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                Text(name,style: TextStyle(fontSize: 20,fontFamily: 'BreeSerif',color: Colors.black54),),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            Text("Email : ",style: TextStyle(fontSize: 20),),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                Text(email,style: TextStyle(fontSize: 20,fontFamily: 'BreeSerif',color: Colors.black54),),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => UpdateProfile())));
                }, 
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey[300]),
                child: Text('Change Profile',
                  style: TextStyle(fontSize: 17),)),
              ],
            )
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.2,
            //   width: double.infinity,
            //   child: Center(
            //     child: Text("This page is Under Construction !! \n Thanks for your support")
            //   )
            // )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      //  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
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
            .child('userimages')
            .child(name + '.jpg');
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
          name=snapshot.get('name');
          email = snapshot.get('email');
          print(photo);
        });
      } on FirebaseException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
    // }
  }
  
  void signout() async {
    final googleAccount = GoogleSignIn();
    googleAccount.signOut();
    print("normal email signout $uid");
    await auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MyLogin())));
  }
}


/*
SizedBox(
              height: MediaQuery.of(context).size.height * 0.019,
            ),
            Text(name,style: TextStyle(fontSize: 20,fontFamily: 'BreeSerif'),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            Text(email,style: TextStyle(fontSize: 20,fontFamily: 'BreeSerif'),),
*/