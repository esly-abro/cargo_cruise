import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'driusr.dart'; // Importing driusr.dart

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
              children: [
                SafeArea(
                  child: Text(
                    "Cargo\nCruise",
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0d5393),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Add some space between the texts
                Text(
                  "“Get your goods delivered swiftly with our reliable app for seamless shipping!”",
                  style: TextStyle(
                    fontFamily: 'montaguslab', // Change to your desired font family
                    fontSize: 20, // Change to your desired font size
                    fontWeight: FontWeight.normal, // Change to your desired font weight
                    color: Color(0xFF5b92ba), // Change to your desired color
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0d5393), // Background color
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return driusr();
                    })); // Corrected the navigation
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // To align the icon and text horizontally
                    children: [
                      Icon(Icons.arrow_forward_rounded, color: Colors.white), // Icon
                      Text(
                        "Get Started  ",
                        style: TextStyle(color: Colors.white), // Text color
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
