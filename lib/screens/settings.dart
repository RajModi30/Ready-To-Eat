import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'dart:io';

import 'package:shoppuneet/screens/profile/update.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(color: Colors.black87),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber.shade300,
        elevation: 0,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.fill)
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.003,
              ),
              Text(name,style: TextStyle(fontSize: 20,fontFamily: 'BreeSerif'),),
              Text(email,style: TextStyle(fontSize: 15,fontFamily: 'BreeSerif',color: Colors.black54),),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                // width: MediaQuery.of(context).size.width * 0.03,
              ),
              Divider(color: Colors.black54,),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                title: Text("Change Password"),
                onTap: () {
              //  Navigator.push(
              //    context,
              //    MaterialPageRoute(builder: (context) => UpdateProfile()),
              // );
                },
                
                trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.payment,
                  color: Colors.red),
                title: Text("Payment"),
                onTap: () {
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyAcc()),
              // );
                },
                trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black),
                subtitle: Text(
                  "Manage Your Payment Methods",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
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
}