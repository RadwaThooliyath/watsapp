import 'package:flutter/material.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Communities",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.qr_code_scanner, color: Colors.white),
          SizedBox(width: 30),
          Icon(Icons.camera_alt_outlined, color: Colors.white),
          SizedBox(width: 30),
          Icon(Icons.more_vert_sharp, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
        children: [
          Image.asset(
            "assets/w.jpg",
            height: 150,
            width: 150,
          ),
          SizedBox(height: 20), // Space between image and text
          Text(
            "Stay connected with a community",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center, // Center text
          ),
          SizedBox(height: 10), // Space between the first and second text
          Text(
            "Communities bring members together in topic-based groups, and make it easy to get admin announcement.Any community you're added to will appear here",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center, // Center text
          ),
          SizedBox(height: 20), // Space between button and additional text
          Text(
            "See Example Communities",
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline, // Underline text
            ),
            textAlign: TextAlign.center, // Center text
          ),
          SizedBox(height: 20), // Space between text and button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30), // Add horizontal padding for the button
            child: ElevatedButton(
              onPressed: () {
                // Handle button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Green background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 10), // Increased button height
                minimumSize: Size(double.infinity, 40), // Full width and fixed height
              ),
              child: Text(
                "Start your community",
                style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 18, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
