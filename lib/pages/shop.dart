import 'package:flutter/material.dart';
import 'package:week04/pages/food.dart';

class Shop extends ChangeNotifier{
// รายการอาหาร
  final List<Food> _foodMenu = [
    // Tuna sushi => sushi(1)
    Food(
        name: "Tuna Sushi",
        price: "10.00",
        imagePath: "lib/images/sushi(1).png",
        rating: "5.0"),
    // Salmon
    Food(
        name: "Salmon Sushi",
        price: "12.00",
        imagePath: "lib/images/sushi(2).png",
        rating: "4.9"),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter method 
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  double summaryPrice = 0.0;
  //add to cart
  void addToCart(Food foodItem, int quantity){
    for (int loop = 0; loop < quantity; loop++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }

    double calculateTotalPrice() {
    double total = 0;
    for (var foodItem in _cart) {
      total += double.parse(foodItem.price);
    }
    summaryPrice = total;
    
    return summaryPrice;
  }

}