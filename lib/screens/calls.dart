import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  final List<Map<String, String>> callData = [
    {'name': 'John Doe', 'dateTime': 'Yesterday 2:00 PM', 'type': 'phone', 'callStatus': 'incoming', 'image': 'assets/4.jpg'},
    {'name': 'Jane Smith', 'dateTime': 'Today 10:15 AM', 'type': 'video', 'callStatus': 'outgoing', 'image': 'assets/2.jpg'},
    {'name': 'Michael Johnson', 'dateTime': 'Today 8:45 AM', 'type': 'phone', 'callStatus': 'incoming', 'image': 'assets/3.jpg'},
    {'name': 'Emily Davis', 'dateTime': 'Yesterday 5:30 PM', 'type': 'video', 'callStatus': 'outgoing', 'image': 'assets/1.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calls",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.qr_code_scanner, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.camera_alt_outlined, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.more_vert_sharp, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "Favourites",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some space between title and row
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8), // Add some padding to make the icon fit
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 20, // Adjust the size of the heart icon
                      ),
                    ),
                    SizedBox(width: 10), // Space between circle and text
                    Text(
                      "Add to Favourites",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Recent",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: callData.length,
                  itemBuilder: (context, index) {
                    final call = callData[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(call['image']!),
                      ),
                      title: Text(
                        call['name']!,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            call['callStatus'] == 'incoming'
                                ? Icons.call_received
                                : Icons.call_made,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 10),
                          Text(
                            call['dateTime']!,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          call['type'] == 'video' ? Icons.video_call_outlined : Icons.phone,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Handle call action
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Handle phone icon action
              },
              backgroundColor: Colors.green,
              child: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
