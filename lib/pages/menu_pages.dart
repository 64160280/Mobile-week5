import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:week04/ColorTheme/color.dart';
import 'package:week04/components/button.dart';
import 'package:week04/components/food_tile.dart';
import 'package:week04/pages/food_details_page.dart';
import 'package:week04/pages/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    // Fetch menu data when the page is loaded
    fetchMenuData();
  }

  // Function to fetch menu data
  void fetchMenuData() async {
    try {
      final shop = context.read<Shop>();
      await shop.fetchMenu();
    } catch (e) {
      // Handle errors, e.g., show an error message
      print('Error fetching menu data: $e');
    }
  }

  void navigateFoodItemDetailPage(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          'Pet Thailand',
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          // cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cartpage'),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Consumer<Shop>(
        builder: (context, shop, child) {
          final foodMenu = shop.foodMenu;

          return Column(
            children: [
              //Promotion banner
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 30,
                ),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get 20% Promo',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        MyButton(onTap: () {}, text: 'Redeem'),
                      ],
                    ),
                    //Image
                    Image.asset(
                      'lib/images/pet-food.png',
                      height: 100,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search here...',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Food Menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Pet Menu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18,
                  ),
                ),
              ),
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
              // Popular Food
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 25,
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/images/dog.png',
                          height: 60,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dog cookie',
                              style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            //Price
                            Text(
                              '\$10.00',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //heart
                    const Icon(Icons.favorite_outline, color: Colors.grey, size: 28),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
