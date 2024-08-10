import 'package:cargo_cruise/drilog.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'usrdst.dart'; // Importing usrdst.dart

void main() {
  runApp(MaterialApp(
    home: driusr(),
  ));
}

class driusr extends StatelessWidget {
  const driusr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Text(
                    "Cargo\nCruise",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0d5393),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF0d5393), width: 3.0),
                          padding: EdgeInsets.all(10.0),
                          minimumSize: Size(150, 49),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return drilog();
                          }));
                        },
                        child: Text(
                          'DRIVER',
                          style: TextStyle(
                            color: Color(0xFF0d5393),
                            fontSize: 20,
                            fontFamily: 'inter',
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF0d5393), width: 3.0),
                          padding: EdgeInsets.all(10.0),
                          minimumSize: Size(150, 49),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return usrdst();
                          }));
                        },
                        child: Text(
                          'USER',
                          style: TextStyle(
                            color: Color(0xFF0d5393),
                            fontSize: 20,
                            fontFamily: 'inter',
                          ),
                        ),
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
