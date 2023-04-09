import 'package:flutter/material.dart';
import 'package:shoppuneet/models/category.dart';

class Utils {
  static List<Category_item> getMockedcategories() {
    return [
      // NAMKEEN ITEMS
      Category_item(
          image: d1.Namkeen,
          c1: Colors.green,
          c2: Colors.green.shade100,
          title: "Namkeen",
          onTap: () {},
          subcategory: [
            Product(
                image: d1.namkeen_chanajor,
                title: "Chana Chor Garam",
                price: "₹60/150 gm",
                
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.red,
                      c2: Colors.red.shade100,
                      decription: "Ingredients : \nGram(chana), Spicies, Edible oil, Salt. \n\nBEST BEFORE 2 MONTHS",
                          
                      cartCategory: [
                        CartDetails(product_price: 60, unit: "150 gm")
                      ])
                ]),
            Product(
                image: d1.namkeen_fulvadi,
                title: "Fulvadi",
                price: "₹65/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.yellow,
                      c2: Colors.yellow.shade100,
                      decription: "Ingredients : \nGram Flour, Spicies, Edible oil, Salt. \n\nBEST BEFORE 2 MONTHS. ",
                          
                      cartCategory: [
                        CartDetails(product_price: 65, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.namkeen_kachori,
                title: "Dry Fruit Kachori",
                price: "₹90 /250 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.green,
                      c2: Colors.green.shade100,
                      decription: "Ingredients : \nRefined Wheat FLour, Besan (Gram FLour), Dry Mango Powder, Edible Oil, Spices & Condiments, Sugar, Asafoetida & Bay Leaf, Iodized salt. \n\nCalories : 500 Kcal \n\nBEST BEFORE 2 MONTHS",
                          
                      cartCategory: [
                        CartDetails(product_price: 90, unit: "250 gm")
                      ])
                ]),
            Product(
                image: d1.namkeen_naylonsev,
                title: "Naylon sev",
                price: "₹60 / 200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.amber,
                      c2: Colors.amber.shade100,
                      decription: "Ingredients : \nBesan(Gram Flour), Edible oil, Salt. \n\nBEST BEFORE 2 MONTHS",
                      
                      cartCategory: [
                        CartDetails(product_price: 60, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.soya_chips,
                title: "Soya Chips",
                price: "₹40/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.redAccent,
                      c2: Colors.redAccent.shade100,
                      decription:
                          "Ingredients : \nVegatble Oil(Palmolien Oil), Tapioca Starch(28%), Soyabean flour(15%), Urad dal powder(8%), Rice powder(12%), Iodized salts, Spices & Condiments. \n\nCalories : 520 Kcal. \n\nBEST BEFORE 2 MONTHS",
                      cartCategory: [
                        CartDetails(product_price: 40, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.soya_sticks,
                title: "Soya Sticks",
                price: "₹40/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.greenAccent,
                      c2: Colors.greenAccent.shade100,
                      decription:
                          "Ingredients : \nVegatble Oil(Palmolien Oil), Tapioca Starch(28%), Soyabean flour(15%), Urad dal powder(8%), Rice powder(12%), Iodized salts, Spices & Condiments. \n\nCalories : 520 Kcal. \n\nBEST BEFORE 2 MONTHS",
                      cartCategory: [
                        CartDetails(product_price: 40, unit: "200 gm")
                      ])
                ]), 
          ]),
      // POPCORNS
      Category_item(
          image: d1.Popcorn,
          // c1: Colors.orange,
          // c2: Colors.orange.shade100,
          c1: Colors.orange,
          c2: Colors.orange.shade100,
          title: "Popcorns",
          onTap: () {},
          subcategory: [
            Product(
                image: d1.popcorn_cheese,
                title: "Cheese Popcorn",
                price: "₹40/80 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.orange,
                      c2: Colors.orange.shade100,
                      decription: "Ingredients : \nPopcorn Kernals, Oil, Salt, Cheese Seasoning. \n\nCalories : 451.68 Kcal \n\nBEST BEFORE 60 DAYS",
                          
                      cartCategory: [
                        CartDetails(product_price: 40, unit: "80 gm")
                      ])
                ]),
            Product(
                image: d1.popcorn_butter,
                title: "Butter Popcorn",
                price: "₹35/80 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.blue,
                      c2: Colors.blue.shade100,
                      decription: "Ingredients : \nPopcorn Kernals, Oil, Salt, Butter flavour. \n\nCalories : 451.68 Kcal \n\nBEST BEFORE 60 DAYS",
                          
                      cartCategory: [
                        CartDetails(product_price: 35, unit: "80 gm")
                      ])
                ]),
            Product(
                image: d1.popcorn_garlic,
                title: "Garlic Popcorn",
                price: "₹40/80 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.pink,
                      c2: Colors.pink.shade100,
                      decription: "Ingredients : \nPopcorn Keranals, Oil, Salt, Garlic powder. \n\nCalories : 390 Kcal \n\nBEST BEFORE 60 DAYS", 
                          
                      cartCategory: [
                        CartDetails(product_price: 40, unit: "80 gm")
                      ])
                ]),
            Product(
                image: d1.popcorn_cheedar,
                title: "Cheddar Cheese Popcorn",
                price: "₹40/80 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.brown,
                      c2: Colors.brown.shade100,
                      decription: "Ingredients : \nCheese powder, Popcorn Kernals, Oil, Salt \n\nCalories : 400 Kcal \n\nBEST BEFORE 60 DAYS",
                          
                      cartCategory: [
                        CartDetails(product_price: 40, unit: "80 gm")
                      ])
                ]),
            Product(
                image: d1.popcorn_regular,
                title: "Regular Popcorn",
                price: "₹35/80 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.red,
                      c2: Colors.red.shade100,
                      decription: "Ingredients : \nPopcorn Kernals, Oil, Salt, Turmeric powder. \n\nCalories : 380 Kcal \n\nBEST BEFORE 60 DAYS",
                          
                      cartCategory: [
                        CartDetails(product_price: 35, unit: "80 gm")
                      ])
                ]),
            Product(
                image: d1.popcorn_schezwan,
                title: "Schezwan Popcorn",
                price: "₹35/80 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.green,
                      c2: Colors.green.shade100,
                      decription: "Ingredients : \nPopcorn Kernals, Oil, Kashmiri Chilly, Mango powder, Black salt, Dehydrated ginger & cumin, Black pepper. \n\nCalories : 438.98 Kcal \n\nBEST BEFORE 60 DAYS",
                          
                      cartCategory: [
                        CartDetails(product_price: 35, unit: "80 gm")
                      ])
                ]),
          ]),
      // SIKANDAR PEANUTS
      Category_item(
          image: d1.Sikandar_Peanuts,
          c1: Colors.blue,
          c2: Colors.blue.shade100,
          title: "Sikandar Peanuts",
          onTap: () {},
          subcategory: [
            Product(
                image: d1.sikandar_peanuts_vc200,
                title: "Roasted Peanuts 200 gm",
                price: "₹56/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.pink,
                      c2: Colors.pink.shade100,
                      decription:
                          "Ingredients : \nPeanuts, Iodized Salt. \n\nContains : \nPeanuts \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 56, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.sikandar_peanuts_vc500,
                title: "Roasted Peanuts 500 gm",
                price: "₹140/500 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.green,
                      c2: Colors.green.shade100,
                      decription:
                          "Ingredients : \nPeanuts, Iodized Salt. \n\nContains : \nPeanuts \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 140, unit: "500 gm")
                      ])
                ]),
            Product(
                image: d1.sikandar_peanuts_hf150,
                title: "Husk-Free Peanuts 150 gm",
                price: "₹40/150 gm ",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.purple,
                      c2: Colors.purple.shade100,
                      decription:
                          "Ingredients : \nGroundnuts, Edible Vegetable Oil, Salt. \n\nContains : \nPeanuts \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 40, unit: "150 gm")
                      ])
                ]),
            Product(
                image: d1.sikandar_peanuts_hf500,
                title: "Husk-free Peanuts 500 gm",
                price: "₹135/500 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.grey,
                      c2: Colors.grey.shade300,
                      decription:
                          "Ingredients : \nGroundnuts, Edible Vegetable Oil, Salt. \n\nContains : \nPeanuts \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 135, unit: "500 gm")
                      ])
                ]),
            Product(
                image: d1.sikandar_peanuts_np_masala,
                title: "Nimboo Phudina Peanuts 200 gm",
                price: "₹50/200 gm ",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.purple,
                      c2: Colors.purple.shade100,
                      decription:
                          "Ingredients : \nGroundnuts, Edible Vegetable Oil, Salt, Lemon powder, Mint powder, Spices & Condiments. \n\nContains : \nPeanuts \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 50, unit: "200 gm")
                      ])
                ]),
          ]),
      // SIKANDAR GRAMS
      Category_item(
          image: d1.Sikandar_Chana,
          c1: Colors.brown,
          c2: Colors.brown.shade100,
          title: "Sikandar Gram",
          onTap: () {},
          subcategory: [
            Product(
                image: d1.sikandar_chana_salted,
                title: "Roasted Salted \n Chana 200 gm",
                price: "₹50/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.brown,
                      c2: Colors.brown.shade100,
                      decription:
                          "Ingredients : \nRoasted Bengal Gram, Turmeric Powder, Iodized Salt. \n\nCalories : 110 \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 50, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.sikandar_chana_mora,
                title: "Roasted Chana 200 gm",
                price: "₹50/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.deepOrange,
                      c2: Colors.deepOrange.shade100,
                      decription:
                          "Ingredients : \nRoasted Bengal Gram, Turmeric Powder, Iodized Salt. \n\nCalories : 110 \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 50, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.sikandar_chana_hfsalted,
                title: "Husk-free salted chana",
                price: "₹45/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.black,
                      c2: Colors.black.withOpacity(0.5),
                      decription:
                          "Ingredients : \nRoasted Bengal Gram,Refined Palmolein Oil, Black Salt, Iodized Salt, Asafoetida. \n\nCalories : 105 \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 45, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.sikandar_chana_hfmora,
                title: "Husk-free roasted chana",
                price: "₹45/200 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.yellow,
                      c2: Colors.yellow.shade100,
                      decription:
                          "Ingredients : \nRoasted Bengal Gram. \n\nCalories : 100 \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 45, unit: "200 gm")
                      ])
                ]),
            Product(
                image: d1.siknadar_chana_bp_masala,
                title: "Black Pepper Chana 200 gm",
                price: "₹45/200 gm ",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.purple,
                      c2: Colors.purple.shade100,
                      decription:
                          "Ingredients : \nRoasted Bengal Gram, Salt, Black pepper, Spices & Condiments. \n\nCalories : 100 \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 45, unit: "200 gm")
                      ])
                ]),
          ]),
      // KARACHI BISCUITS
      Category_item(
          image: d1.Biscuit,
          c1: Colors.red,
          c2: Colors.pink.shade100,
          title: "Karachi Biscuits",
          onTap: () {},
          subcategory: [
            Product(
                image: d1.biscuit_karachi,
                title: "Karachi Fruit Biscuit",
                price: "₹190/400 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.red,
                      c2: Colors.red.shade100,
                      decription:
                          "Ingredients : \nRefined Wheat FLour, Sugar, Edible Vegatable Fat, Papaya Pieces(10%), Cashew(6%), Milk Solids, Iodized salt. \n\nSubstances : Vanilla and Mixed Fruit. \n \nContains : Wheat, Cashew nuts, Milk. \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 190, unit: "400 gm")
                      ])
                ]),
            Product(
                image: d1.biscuit_pista_karachi,
                title: "Karachi Biscuit- Pista",
                price: "₹200/400 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Color.fromARGB(255, 250, 230, 208),
                      c2: Color.fromRGBO(250, 230, 208, 0.5),
                      decription:
                          "Ingredients : \n Refined Wheat FLour, Sugar, Edible Vegatable Fat, Milk Solids,Powdered Natural Spices, Cashew powder. \n \nContains permitted Synthetic food colours. \n \nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 200, unit: "400 gm")
                      ])
                ]),
            Product(
                image: d1.biscuit_osmania_karachi,
                title: "Karachi Biscuit- Osmania",
                price: "₹160/400 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.green,
                      c2: Colors.green.shade100,
                      decription:
                          "Ingredients : \nRefined Wheat FLour, Sugar, Edible Vegatable Fat, Table Butter, Milk Solids, Iodized salt. \n\nContains NO ARTIFICIAL COLOURS & FLAVORS \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 160, unit: "400 gm")
                      ])
                ]),
            Product(
                image: d1.biscuit_dd_karachi,
                title: "Karachi Biscuit- \n Double Delight",
                price: "₹190/400 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.black,
                      c2: Colors.black.withOpacity(0.5),
                      decription:
                          "Ingredients : \nRefined Wheat FLour, Sugar, Edible Vegatable Fat, Milk Solids, Iodized salt. \n\nContains : Wheat, Milk. \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 190, unit: "400 gm")
                      ])
                ]),
            Product(
                image: d1.biscuit_cc_karachi,
                title: "Karachi Biscuit- \n Chocolate Cashew",
                price: "₹210/400 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.pink,
                      c2: Colors.pink.shade100,
                      decription:
                          "Ingredients : \nRefined Wheat FLour, Sugar, Edible Vegatable Fat, Chocolate (Cocoa Powder), Cashew Bits, Milk Solids, Raising Agent E500(ii). \n\nContains : Added Flavors (Artificial And Natural Flavoring Substances - Vanilla). \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 210, unit: "400 gm")
                      ])
                ]),
            Product(
                image: d1.biscuit_cashew_karachi,
                title: "Karachi Biscuit- Cashew",
                price: "₹190/400 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.blue,
                      c2: Colors.blue.shade100,
                      decription:
                          "Ingredients : \nRefined Wheat FLour, Sugar, Edible Vegatable Fat, Cashew bits(12%), Milk Solids, Iodized salt. \n\nSubstances : Vanilla and Mixed Fruit. \n\nContains permitted Synthetic food colours. \n\nBEST BEFORE 60 DAYS",
                      cartCategory: [
                        CartDetails(product_price: 190, unit: "400 gm")
                      ])
                ]),
          ]),
      /*
      Category_item(
          image: d1.beverages,
          c1: Colors.purple,
          c2: Colors.purple.shade100,
          title: "Beverages",
          onTap: () {},
          subcategory: [
            Product(
                image: d1.beverages_coffee,
                title: "Coffee",
                price: "₹175/100 gm",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.black,
                      c2: Colors.black.withOpacity(0.5),
                      decription:
                          "Start your day right with the first sip of Nescafe Classic Instant Coffee. Let the intense taste of coffee awaken your mind and body to new opportunities as the rich aroma of this distinctive blend unfolds.This coffee mix is an excellent way to kick start the day.",
                      cartCategory: [
                        CartDetails(product_price: 175, unit: "100 gm")
                      ])
                ]),
            Product(
                image: d1.beverages_hell,
                title: "Hell",
                price: "₹42/100 ml",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.redAccent,
                      c2: Colors.redAccent.shade100,
                      decription:
                          "Hell Energy drinks contain only quality ingredients such as only real granulated sugar is used which brings quick energy to the body. The benefits of the drink includes increased performance, heightened concentration, shorter reaction time, wakefulness, improved moods and better metabolism.",
                      cartCategory: [
                        CartDetails(product_price: 42, unit: "100 gm")
                      ])
                ]),
            Product(
                image: d1.beverages_juices,
                title: "Mango Juice",
                price: "₹40/600 ml",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.orange,
                      c2: Colors.orange.shade100,
                      decription:
                          "Mango juice is derived from mango fruit, which grows on tropical trees that belong to the Mangifera genus. Mango juice is made by pressing or blending out the juice from the soft, orange pulp of the mango to deliver significant amounts of vitamin C, vitamin A, potassium, iron, various carotenoids, and potent organic acids in every glass of juice.",
                      cartCategory: [
                        CartDetails(product_price: 40, unit: "600 ml")
                      ])
                ]),
            Product(
                image: d1.beverages_milk,
                title: "Milk",
                price: "₹30/500 ml",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.pink,
                      c2: Colors.pink.shade100,
                      decription:
                          "Amul Taaza fresh toned milk is an excellent quality milk from Gujarat. It can be consumed directly from the pack. This milk is excellent for making tea, coffee, adding to your breakfast cereals and preparing desserts or sweets.",
                      cartCategory: [
                        CartDetails(product_price: 30, unit: "500 ml")
                      ])
                ]),
            Product(
                image: d1.beverages_tea,
                title: "Tea",
                price: "₹429/1 kg",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.red,
                      c2: Colors.red.shade100,
                      decription:
                          "Brews togetherness by bringing people together over a tasty cup of tea made with your love and warmth. Start your mornings with Red Label Natural Care Tea. Indulge in truly rich flavours of this tea in every sip you have.",
                      cartCategory: [
                        CartDetails(product_price: 429, unit: "1 kg")
                      ])
                ]),
            Product(
                image: d1.beverages_water,
                title: "Water",
                price: "₹10/500 ml",
                productSubCategory: [
                  ProductDetails(
                      c1: Colors.blue,
                      c2: Colors.blue.shade100,
                      decription:
                          "The water in a Bisleri Mineral Water is typically sourced from the best Himalayan Mountain sources before being purified and packaged for drinking purposes. The water contains traces of calcium, magnesium, pH factor and even TDS and chlorides.",
                      cartCategory: [
                        CartDetails(product_price: 10, unit: "500 ml")
                      ])
                ]),
          ])
        */
    ];
  }
}
