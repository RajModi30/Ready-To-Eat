import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoppuneet/firebase/auth.dart';
import 'package:shoppuneet/screens/login.dart';
import 'package:shoppuneet/screens/profile/profilescreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  List<String> s1 = [
    "assets/images/slide/sikandar.png",
    "assets/images/slide/MASALA SING.png",
    // "assets/images/home_image2.jpg",
    "assets/images/slide/soya products.png",
  ];
  void changeSelected(int index) {
    setState(() {
      selected = index;
    });
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
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
            
          ],
        )
      ),
    );
  }

  void signout() async {
    final googleAccount = GoogleSignIn();
    googleAccount.signOut();
    print("normal email signout $uid");
    await auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MyLogin())));
  }

}

final colors = [
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.indigo,
  Colors.redAccent
];