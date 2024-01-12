import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week04/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            // Shop name
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            //---------------------------------
            // icon
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/images/sushi.png'),
            ),
            const SizedBox(height: 25),

            // title
            Text("THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                )),
            const SizedBox(height: 25),

            // Subtitle
            Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),
            // Get started button
            MyButton(
              text: "Get started",
              onTap: () {
                // go to menu pages
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
