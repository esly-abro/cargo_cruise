import 'package:cargo_cruise/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: usrdst(),
  ));
}

class usrdst extends StatefulWidget {
  const usrdst({Key? key}) : super(key: key);

  @override
  _usrdstState createState() => _usrdstState();
}

class _usrdstState extends State<usrdst> {
  late String title;
  late String text;
  void _setText() {
    setState(() {

      text = title;
      print(text);
    });
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
              labelText: 'From',
              hintText: 'Enter Origin',
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
            onChanged: (value) => title = value,
          ),
          SizedBox(height: 30,),
          TextFormField(
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              labelText: 'To',
              hintText: 'Enter Destination',
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

              onPressed: _setText,

              child: Row(
                mainAxisSize: MainAxisSize.min, // To align the icon and text horizontally
                children: [

                Icon(Icons.search, color: Color(0xFF0d5393)), // Icon
            Text(
              "SEARCH  ",
              style: TextStyle(color: Color(0xFF0d5393)), // Text color
            ),

  ]
          )
    )
    ]
    ),
    ),
    ),
      ),
    );
  }
}
