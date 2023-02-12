import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/screens/home/BottomNavigation.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String name = "";
  String email = "";

  String id = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  
  bool isButton = false;
  
  void initState() {
    isButton = false;
    getUserData();
    // pickImage();

  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  void updateName(String value) {
    setState(() {
      name = value;
      isButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    emailController.text = email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text("Update your profile",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Row(
              children: [
                Text("Name *",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.002,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                textDirection: TextDirection.ltr,
                // textAlign: TextAlign.right,
                maxLength: 32,
                onChanged: updateName
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Row(
              children: [
                Text(
                    "Email *",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.002,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  enabled: false,
                ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: isButton == true
                  ? () {
                    updateUserData();
                    print("clicked");
                    Navigator.push(
                      context, MaterialPageRoute( builder: (context) => BottomNavigation())
                    );
                  }
                  : null,
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(500, 50))
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> updateUserData() async {
    // final uid=GoogleButton().authResult.user
    if (user == null) {
      print("user is not exist");
    } else {
      try {
        final user = auth.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user)
            .update({"name": nameController.text});
        print(user);
      } on FirebaseException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
    }
  }

  Future<void> getUserData() async {
    // final uid=GoogleButton().authResult.user
    if (user == null) {
      print("user is not exist");
    } else {
      try {
        final user = auth.currentUser!.uid;
        final DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user)
            .get();
        print(user);
        // id=userDoc.get('id');
        setState(() {
          name = snapshot.get('name');
          email = snapshot.get('email');
        });
      } on FirebaseException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
    }
  }
}