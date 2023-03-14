import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppuneet/deafults.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/screens/category/categoryscreen.dart';
// import 'package:shoppuneet/screens/home/BottomNavigation.dart';
import 'package:shoppuneet/screens/login.dart';
import 'package:shoppuneet/screens/profile/profilescreen.dart';
import 'package:shoppuneet/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int activeIndex = 0;
  int index = 0;
  int selected = 0;
  String photo = "";
  String email = "";
  File? image;
  var name="";
  List<String> s1 = [
    "assets/images/slide/sikandar.png",
    "assets/images/slide/MASALA SING.png",
    "assets/images/slide/soya products.png",
    "assets/images/slide/popcorn1.png",
  ];
  void changeSelected(int index) {
    setState(() {
      selected = index;
    });
  }
  void initState() {
    getUserData();
  }
  /*
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(

        ),
        appBar: AppBar(
          backgroundColor: Colors.amber.shade300,
          title: Text("Home",style: TextStyle(color: Colors.black87),),
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.lime.shade100,
              child: Icon(Icons.search,size: 20,color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Colors.lime.shade100,
                child: Icon(Icons.shopping_bag,size: 20,color: Colors.black,),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(
            children: [
              Container(
                height: height * 0.22,
                // width: double.infinity,
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.start,          
                //   children: [
                //     Image.asset('assets/images/pgu design.png',width: double.infinity,height: 80,),
                //     SizedBox(height: 80,),
                //     Text("THIS PAGE IS UNDER CONSTRUCTION !!",style: TextStyle(fontSize: 20),), 
                //   ],
                // ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/slide/sikandar.png"),
                    fit: BoxFit.cover,
                    ),
                  borderRadius: BorderRadius.circular(10),
                // color: Colors.red
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
  /*          SizedBox(
              width: width * 0.05,
              height: height * 0.24,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: NetworkImage(photo),)
                ),
                child: Column(
                  children: [
                    Text(name),
                    SizedBox(height: height*0.02,),
                    Text(email)
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black45,), 
  */
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     // shape: BoxShape.circle,
            //     // image: photo,
            //     color: Colors.blue,
            //   ),
            //   child: Image(image: NetworkImage(photo)),
            //   // child: Text('Welcome '+ name + '  !',style: TextStyle(fontFamily: 'BreeSerif',fontSize: 17),),
            // ),
            SizedBox(
              height: height * 0.04,
            ),
            CircleAvatar(
              child: ClipOval(
                child: Container(
                  height: height * 0.25,
                  width: width * 0.25,
                  child: Image.network(photo,fit: BoxFit.fill,)),
              ),
              radius: 48,
            ),
            SizedBox(height: height * 0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,style: TextStyle(fontFamily: 'BreeSerif',fontSize: 20,color: Colors.black54),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(email,style: TextStyle(fontFamily: 'BreeSerif',fontSize: 17,color: Colors.black54),),
              ],
            ),
            Divider(color: Colors.black45,),
            ListTile(
              selected: selected == 0,
              leading: const Icon(Icons.person),
              title: const Text(
                "Home",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
                // return const HomeScreen();
                // changeSelected(0);
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => BottomNavigation()));
              },
              trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black
                ),
            ),
            Divider(color: Colors.black45,),
            ListTile(
              selected: selected == 1,
              leading: const Icon(Icons.person),
              title: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                changeSelected(1);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black
                ),
            ),
            Divider(color: Colors.black45,),
            ListTile(
              selected: selected == 2,
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text(
                "Orders",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: (() => changeSelected(2)),
              trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black
                ),
            ),
            Divider(color: Colors.black45,),
            ListTile(
              selected: selected == 3,
              leading: const Icon(Icons.settings),
              title: const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: (() {
                changeSelected(3);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
              }),
              trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black
                ),
            ),
            Divider(color: Colors.black45,),
            ListTile(
              selected: selected == 4,
              leading: const Icon(Icons.help_outline),
              title: const Text(
                "Help",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                changeSelected(4);
              },
              trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black
                ),
            ),
            Divider(color: Colors.black45,),
            ListTile(
              trailing: Icon(
                  Icons.arrow_forward_ios, 
                  color: Colors.black
                ),
              selected: selected == 5,
              leading: const Icon(Icons.logout_rounded),
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                changeSelected(5);
                signout();
              }
            ),
            Divider(color: Colors.black45,),
          ],
        ),
        ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade300,
        title: Text("Home",style: TextStyle(color: Colors.black87),),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          CircleAvatar(
            radius: 17,
            backgroundColor: Colors.lime.shade100,
            child: Icon(Icons.search,size: 20,color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.lime.shade100,
              child: Icon(Icons.shopping_bag,size: 20,color: Colors.black,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 15),
                child: CarouselSlider.builder(
                    itemCount: s1.length,
                    options: CarouselOptions(
                        height: height * 0.22,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.9,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // print(reason.toString());//print the reason either auto or manual
                            activeIndex = index;
                          });
                        }),
                    itemBuilder: (context, index, realIndex) {
                      final image = s1[index];
                      return Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
            ),
            AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: s1.length,
                effect: CustomizableEffect(
                  dotDecoration: const DotDecoration(
                    color: Colors.black54,
                    width: 10,
                    height: 10,
                  ),
                  activeDotDecoration: DotDecoration(
                    borderRadius: BorderRadius.circular(100),
                    width: 20,
                    height: 20,
                  ),
                  activeColorOverride: (i) => colors[i]
                )
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),  
                  GestureDetector(
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => categoryScreen()));
                  },
                  child: const Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListContainer1(),
          const SizedBox(height: 20),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Popular",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListContainer2(
            s1: Axis.horizontal,
          ),
          const SizedBox(
            height: 30,
          )
              /*
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("NAMKEEN",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'BOOKOS.ttf'
                      )
                    ),
                    GestureDetector(
                      child: Text("VIEW ALL",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: 'BOOKOS.ttf'
                        )
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategoryScreen()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 250,
                      width: 150,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/items/chakri/naylon sev.png')
                          ),
                          Expanded(child: Container(
                            child: Column(
                              children: [
                                Text('Naylon Sev',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('Weight : 200 gm',style: TextStyle(fontSize: 12.8),),
                                SizedBox(height: 3,),
                                Text("Price : 40 Rs.")
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              */
              // nothing
            ],
          ),
        )
      ),
    );
  }

  void signout() async {
    final googleAccount = GoogleSignIn();
    googleAccount.signOut();
    print("normal email signout $uid");
    await auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyLogin()));
  }

  Future<void> pickImage() async {
    try {
       final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
      // if (image == null) return;
      final imageSelect = File(image2!.path);
      this.image= imageSelect;
      print(image);
      if (user == null) {
        // print("exist");
      } 
      else {
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
    } 
    on PlatformException catch (e) {
      Fluttertoast.showToast(msg: e.code);
    } 
    catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }


    try {
       final image = await ImagePicker().pickImage(source: ImageSource.camera);
      // if (image == null) return;
      final imageSelect = File(image!.path);
      this.image = imageSelect;
      print(image);
      if (user == null) {
        // print("exist");
      } 
      else {
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
    } 
    on PlatformException catch (e) {
      Fluttertoast.showToast(msg: e.code);
    } 
    catch (e) {
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

final colors = [
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.indigo,
  Colors.redAccent
];