import 'package:cargo_cruise/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For File handling

void main() async {
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
  File? _image; // Store the selected image here

  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    if (selectedImage != null) {
      setState(() {
        _image = File(selectedImage.path); // Store the image file in _image variable
      });
    }
  }

  // Function to simulate saving data
  void detailss() async {
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
          alignment: Alignment.bottomCenter, // Align to bottom center
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, // Move everything to the bottom
                children: [
                  SizedBox(height: 30), // Space at the top

                  // Display the selected image or a placeholder
                  _image != null
                      ? Image.file(_image!, height: 150, width: 150)
                      : Icon(Icons.image, size: 150, color: Colors.grey),

                  SizedBox(height: 30), // Adjust space between image and fields

                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Capacity',
                      hintText: 'Enter capacity',
                      filled: true,
                      fillColor: Color(0xFFffffff),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (value) => capacity = value,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      hintText: 'Enter time',
                      filled: true,
                      fillColor: Color(0xFFffffff),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (value) => time = value,
                  ),

                  SizedBox(height: 30),
                  // Image buttons below the form fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Button to pick image from gallery
                      OutlinedButton.icon(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        icon: Icon(Icons.photo),
                        label: Text("Gallery"),
                      ),
                      SizedBox(width: 20),
                      // Button to capture image from camera
                      OutlinedButton.icon(
                        onPressed: () => _pickImage(ImageSource.camera),
                        icon: Icon(Icons.camera_alt),
                        label: Text("Camera"),
                      ),
                    ],
                  ),

                  SizedBox(height: 30), // Add space between buttons and "NEXT" button

                  // "Next" button with adjusted size to avoid overflow
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF0d5393), width: 2.0),
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(150, 49), // Set minimum button size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return homepage();
                        }),
                      );
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(color: Color(0xFF0d5393)),
                    ),
                  ),
                  SizedBox(height: 30), // Space at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
