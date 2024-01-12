import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week04/ColorTheme/color.dart';
import 'package:week04/components/button.dart';
import 'package:week04/pages/food.dart';
import 'package:week04/pages/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: shop.cart.length,
                itemBuilder: (context, index) {
                  final Food food = shop.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;

                  return Container(
                    decoration: BoxDecoration(
                      color: listCartColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    "Total: \$${shop.calculateTotalPrice()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  MyButton(
                    onTap: () {
                      // Handle the payment logic
                    },
                    text: "Pay Now \$${shop.summaryPrice.toString()}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
