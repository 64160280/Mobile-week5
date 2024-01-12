import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25.0),
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // image
          Image.asset(
            food.imagePath,
            height: 140,
          ),
      
          //Text
          Text(
            food.name,
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
      
          //Price + rate
          SizedBox(
              width: 150,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Price
                    Text('\$' + food.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700])),
      
                    //rating
                    Row(children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Text(food.rating, style: TextStyle(color: Colors.grey)),
                    ])
                  ]))
        ]),
      ),
    );
  }
}
