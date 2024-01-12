import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:week04/ColorTheme/color.dart';
import 'package:week04/components/button.dart';
// import 'package:week04/pages/food.dart';
import 'package:week04/pages/shop.dart';
import '../components/food_tile.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Navigate to food item details page
  void navigateFoodItemDetailPage(int index){
  // get the shop and it's menu 
  final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;


    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage(
      food: foodMenu[index],
    ),),);
  }
  @override
  Widget build(BuildContext context) {
      // get the shop and it's menu 
  final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Icon(
              Icons.menu,
              color: Colors.grey[900],
            ),
            centerTitle: true,
            title: Text(
              'Sushi Thailand',
              style: TextStyle(color: Colors.grey[900]),
            ),
            actions: [
              // cart button
              IconButton(onPressed: () => {
                Navigator.pushNamed(context, '/cartpage'),
              },icon: const Icon(Icons.shopping_cart,)),
            ],
            ),
        body: Column(
          children: [
            //Promotion banner
            Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                margin:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get 32% Promo',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          MyButton(onTap: () {}, text: "Redeen")
                        ]),

                    //Image
                    Image.asset(
                      'lib/images/sushi(4).png',
                      height: 100,
                    ),
                  ],
                )),
            const SizedBox(height: 25),

            //่ส่วนการป้อนข้อมูล (Input bar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Search here...",)),
            ),
            const SizedBox(height: 25),

            // Food Menu
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text("Food Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 18,
                    ))),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateFoodItemDetailPage(index),
                ),
              ),
            ),
            const SizedBox(height: 25),
            //อาหารยอดนิยม
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/images/sushi(1).png',
                          height: 60,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tuna Sushi",
                              style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                            ),
                            const SizedBox(height: 10),

                            //Price
                            Text('\$10.00',
                                style: TextStyle(color: Colors.grey[700]))
                          ],
                        ),
                      ],
                    ),

                    //heart
                    const Icon(Icons.favorite_outline,
                        color: Colors.grey, size: 28),
                  ],
                )),
          ],
        ));
  }
}
