import 'package:cargo_cruise/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'drinext.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MaterialApp(
    home: drilog(),
  ));
}

class drilog extends StatefulWidget {
  @override
  _drilogState createState() => _drilogState();
}

class _drilogState extends State<drilog> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void dispose() {
    // Always dispose controllers to free up resources
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  void detailsf() async {
    String from = fromController.text;
    String to = toController.text;

    await FirebaseFirestore.instance.collection('journeys').add({
      'from': from,
      'to': to,
    });

    // Navigate to the next screen after saving the journey
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => drinext()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/route.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: fromController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'From',
                    hintText: 'Enter origin',
                    filled: true,
                    fillColor: Color(0xFFffffff),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: toController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'To',
                    hintText: 'Enter destination',
                    filled: true,
                    fillColor: Color(0xFFffffff),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF0d5393), width: 2.0),
                    padding: EdgeInsets.all(10.0),
                    minimumSize: Size(150, 49),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  onPressed: () {
                    if (fromController.text.isNotEmpty && toController.text.isNotEmpty) {
                      detailsf(); // Save to Firestore and navigate
                    } else {
                      print('Please fill in both fields');
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "NEXT  ",
                        style: TextStyle(color: Color(0xFF0d5393)),
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
