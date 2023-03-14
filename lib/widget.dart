import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoppuneet/models/category.dart';
import 'package:shoppuneet/models/utils.dart';
import 'package:shoppuneet/providers/categoryselectionservice.dart';
import 'package:shoppuneet/screens/productdecreption.dart';
import 'package:shoppuneet/screens/selectcategory.dart';



class homeContainer extends StatelessWidget {
  const homeContainer({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category_item category;

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catselection =
        Provider.of<CategorySelectionService>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: category.c1, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: category.c2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  catselection.selectedCategory = category;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SelectCategory(catselection.selectedCategory)));
                },
                child: Image.asset(category.image, height: 100))
          ],
        ),
        // SizedBox(height: 5),
        Align(
          alignment: Alignment.center,
          child: Text(
            category.title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]),
    );
  }
}

class ListContainer1 extends StatefulWidget {
  const ListContainer1({
    Key? key,
  }) : super(key: key);

  @override
  State<ListContainer1> createState() => _ListContainer1State();
}

class _ListContainer1State extends State<ListContainer1> {
  List<Category_item> categories = Utils.getMockedcategories();

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catselection = Provider.of<CategorySelectionService>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Container(
        height: 160,
        child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
            itemBuilder: (BuildContext context, int index) {
              Category_item category = categories[index];
              return Container(
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),  
                    color: categories[index].c2,
                    border: Border.all(width: 2, color: categories[index].c1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                      )
                    ]),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          catselection.selectedCategory = category;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectCategory(
                                      catselection.selectedCategory)));
                        },
                        child: Image.asset(
                          category.image,
                          width: 170,
                          height: 100,
                          // fit: BoxFit.fitWidth,
                        
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      category.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ListContainer2 extends StatelessWidget {
  final Axis s1;

  List<Category_item> categories = Utils.getMockedcategories();

  ListContainer2({Key? key, required this.s1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Category_item categories;

    CategorySelectionService catselection =
        Provider.of<CategorySelectionService>(context, listen: false);
    // categories=catselection.selectedCategory.subcategory.length.;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Container(
        height: 200,
        child: GridView.builder(
            scrollDirection: s1,
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: 190,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(width: 2, color: categories[index].c1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            categories[index].subcategory[index].image,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          categories[index].subcategory[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            categories[index].subcategory[index].price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                catselection.selectedProduct =
                                    categories[index].subcategory[index];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDecreption(
                                            catselection.selectProduct)));
                              },
                              child: Icon(
                                Icons.add_circle_rounded,
                                color: Colors.amber,
                                size: 40,
                              ))
                        ],
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}