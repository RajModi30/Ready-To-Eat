
/*
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Categories",style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.amber[300],
        elevation: 0,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("This page is Under Construction !! \n Thanks for your support"))
        ],
        // width: double.infinity,
        // height: double.infinity,
        // color: Colors.deepOrange,
      ));
  }
}*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppuneet/deafults.dart';
import 'package:shoppuneet/models/category.dart';
import 'package:shoppuneet/models/product_model.dart';
import 'package:shoppuneet/models/utils.dart';
// import 'package:groceryapp/screen/declare.dart';
// import 'package:groceryapp/model/utils.dart';
import 'package:shoppuneet/screens/home/home_screen.dart';
import 'package:shoppuneet/widget.dart';

// import 'package:groceryapp/screen/widget.dart';

// import 'bottomnavigationbar.dart';

class categoryScreen extends StatelessWidget {
  Demo d1 = Demo();
  final cartController = Get.put(CartController());
  List<Category_item> categories = Utils.getMockedcategories();

  categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Category",style: TextStyle(color: Colors.black87),),
      //   centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            //   child: Container(
            //     child: Row(
            //       children: [
            //         GestureDetector(
            //           onTap: (){
            //           // Navigator.push(
            //           //   context,
            //           //   MaterialPageRoute(
            //           //     builder: (context) => BottomNavigation()));
            //         },
            //         child: Icon(Icons.arrow_back_ios)),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text("Categories",style: TextStyle(
            //           fontSize: 30,                    
            //       ),),
            //     ],
            //   )),
            // ),
            Padding(
              padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                child: GridView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: screenWidth / 360,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Category_item category = categories[index];
      
                    return homeContainer(category: categories[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
