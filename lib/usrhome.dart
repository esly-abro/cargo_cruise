import 'package:flutter/material.dart';
import 'homepage.dart';
import 'usrdst.dart';
import 'drilog.dart';

void main() {
  runApp(MaterialApp(
    home: usrhome(),
  ));
}

class usrhome extends StatelessWidget {
  // Placeholder variables for driver and vehicle names
  final String driverName = 'John Doe';
  final String vehicleName = 'Truck 1234';

  usrhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cargo Cruise"),
        backgroundColor: Color(0xFF0d5393),
      ),
      body: ListView.builder(
        itemCount: 10, // Sample number of items, you can adjust based on data
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: CircleAvatar(
                backgroundColor: Color(0xFF0d5393),
                child: Icon(Icons.local_shipping, color: Colors.white),
              ),
              title: Text(
                'Driver: $driverName', // Replace this with dynamic data later
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Vehicle: $vehicleName'), // Replace with dynamic vehicle name
              trailing: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return drilog();
                  }));
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF0d5393), width: 2.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'DETAILS',
                  style: TextStyle(
                    color: Color(0xFF0d5393),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
