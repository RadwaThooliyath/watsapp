import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> items = [
    {
      "name": "John Doe",
      "message": "Hey there! How are you?",
      "date": "10:30 AM",
      "profileImage": "assets/4.jpg",
    },
    {
      "name": "Jane Smith",
      "message": "Looking forward to our meeting.",
      "date": "6:45 PM",
      "profileImage": "assets/3.jpg",
    },
    {
      "name": "Alex Johnson",
      "message": "Can you send me the report?",
      "date": "Yesterday",
      "profileImage": "assets/2.jpg",
    },
    {
      "name": "Emily Davis",
      "message": "Thanks for the update!",
      "date": "5/4/2024",
      "profileImage": "assets/1.jpg",
    },
  ];

  Widget _buildCategoryContainer(String title) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildListItem(String name, String message, String date, String profileImage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profileImage), // Use AssetImage for local images
            radius: 30, // Adjust radius to match size of the profile image
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(
            date,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
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
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Row(
                  children: [
                    _buildCategoryContainer('All'),
                    SizedBox(width: 10),
                    _buildCategoryContainer('Unread'),
                    SizedBox(width: 10),
                    _buildCategoryContainer('Favourites'),
                    SizedBox(width: 10),
                    _buildCategoryContainer('Groups'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _buildListItem(
                    item['name']!,
                    item['message']!,
                    item['date']!,
                    item['profileImage']!, // Pass the profile image URL
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 20, // Adjust the position from the bottom
            right: 20, // Adjust the position from the right
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.chat,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
