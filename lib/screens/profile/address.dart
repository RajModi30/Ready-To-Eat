import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/screens/profile/useraddress.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  
  String loc1 = "";
  String loc2 = "";
  String loc3 = "";
  String loc4 = "";
  String loc5 = "";
  

  void initState() {
    // isButton = false;
    getaddress();
    // pickImage();

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade300,
        title: Text("Your Address",style: TextStyle(color: Colors.black87),),
        iconTheme: IconThemeData(color: Colors.black),),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  width: width*1,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Text(loc1,style: TextStyle(fontSize: 10,color: Colors.grey.shade500),),
                      SizedBox(height: height * 0.02,),
                      Text(loc2,style: TextStyle(fontSize: 10,color: Colors.grey.shade500),),
                      SizedBox(height: height * 0.02,),
                      Text(loc3,style: TextStyle(fontSize: 10,color: Colors.grey.shade500),),
                      SizedBox(height: height * 0.02,),
                      Text(loc4,style: TextStyle(fontSize: 10,color: Colors.grey.shade500),),
                      SizedBox(height: height * 0.02,),
                      Text(loc5,style: TextStyle(fontSize: 10,color: Colors.grey.shade500),),
                      SizedBox(height: height * 0.02,),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAddress()),
                  );
                }, 
                child: Text("Add new address"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> getaddress () async {
    try {
      final user = auth.currentUser!.uid;
      // print(user);
      final DocumentSnapshot snapshot = await FirebaseFirestore
        .instance
        .collection("user-addresses")
        .doc(user)
        .collection('address')
        .doc(uid)
        // .collection('address')
        .get();
        
        setState(() {
          loc1 = snapshot.get('address_line_1');
          loc2 = snapshot.get('address_line_2');
          loc3 = snapshot.get('address_line_3');
          loc4 = snapshot.get('address_line_4');
          loc5 = snapshot.get('address_line_5');
        });
      } on FirebaseException catch (error) {
        Fluttertoast.showToast(msg: error.code);
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
  }
}