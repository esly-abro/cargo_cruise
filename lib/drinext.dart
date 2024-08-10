import 'package:cargo_cruise/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: drinext(),
  ));
}

class drinext extends StatefulWidget {
  const drinext({Key? key}) : super(key: key);

  @override
  _drilogState createState() => _drilogState();
}

class _drilogState extends State<drinext> {
  late String time;
  late String capacity;
  void detailss() async{
    try {
      await FirebaseFirestore.instance.collection('journeys').add({
        'capacity': capacity,
        'to': time,

        'timestamp': FieldValue.serverTimestamp(), // Add timestamp for sorting
      });
      // Navigate to the next screen after saving the journey
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => drinext()),
      );
    } catch (e) {
      print('Error saving journey: $e');
      // Handle error
    }
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
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'image',
                      hintText: 'upload image',
                      filled: true,
                      fillColor: Color(0xFFffffff),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                          borderSide: (BorderSide(color: Colors.black))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                        borderSide: (BorderSide(color: Colors.black)),


                      ),
                    ),
                    onChanged: (value) => Null,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'capacity',
                      hintText: 'enter capacity',
                      filled: true,
                      fillColor: Color(0xFFffffff),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                          borderSide: (BorderSide(color: Colors.black))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                        borderSide: (BorderSide(color: Colors.black)),


                      ),
                    ),
                    onChanged: (value) => capacity = value,
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'time',
                      hintText: 'Enter time',
                      filled: true,
                      fillColor: Color(0xFFffffff),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                          borderSide: (BorderSide(color: Colors.black))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                        borderSide: (BorderSide(color: Colors.black)),
                      ),
                    ),
                    onChanged: (value) => time = value,

                  ),
                  SizedBox(height: 30,),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF0d5393),width: 2.0),
                      padding: EdgeInsets.all (10.0),
                      minimumSize: Size(150,49),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        // Background color
                      ),
                    ),

                    onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return homepage();
                  }));
                  },

                    child: Row(
                        mainAxisSize: MainAxisSize.min, // To align the icon and text horizontally
                        children: [


                          Text(
                            "NEXT  ",
                            style: TextStyle(color: Color(0xFF0d5393)), // Text color
                          ),


                        ]
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
