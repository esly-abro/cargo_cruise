import 'package:cargo_cruise/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'drinext.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: drilog(),
  ));
}

class drilog extends StatefulWidget {
  const drilog({Key? key}) : super(key: key);

  @override
  _drilogState createState() => _drilogState();
}

class _drilogState extends State<drilog> {
  late String from;
  late String to;
  void detailsf() async{
    try {
      await FirebaseFirestore.instance.collection('journeys').add({
        'from': from,
        'to': to,
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
       labelText: 'from ',
       hintText: 'Enter origin',
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
          onChanged: (value) => from = value,
        ),
      SizedBox(height: 30,),
      TextFormField(
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          labelText: 'to',
          hintText: 'Enter destination',
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
        onChanged: (value) => to = value,

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
            return drinext();
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
