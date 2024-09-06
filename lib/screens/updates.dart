import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  final List<Map<String, String>> recentUpdates = [
    {
      "name": "John Doe",
      "time": "Today, 10:30 AM",
      "image": "assets/1.jpg",
    },
    {
      "name": "Jane Smith",
      "time": "Yesterday, 6:45 PM",
      "image": "assets/2.jpg",
    },
    {
      "name": "Alex Johnson",
      "time": "Yesterday, 5:00 PM",
      "image": "assets/3.jpg",
    },
    {
      "name": "Emily Davis",
      "time": "2 days ago, 4:20 PM",
      "image": "assets/4.jpg",
    },
  ];

  final List<Map<String, String>> viewedUpdates = [
    {
      "name": "John Doe",
      "time": "Today, 10:30 AM",
      "image": "assets/1.jpg",
    },
    {
      "name": "Jane Smith",
      "time": "Yesterday, 6:45 PM",
      "image": "assets/2.jpg",
    },
  ];

  bool showViewedUpdates = true; // To track the visibility of viewed updates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Updates",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "Status",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          color: Colors.grey[800],
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Status',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tap to add status update',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "Recent updates",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 300, // Adjust the height based on your content
              child: ListView.builder(
                itemCount: recentUpdates.length,
                itemBuilder: (context, index) {
                  final update = recentUpdates[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(update['image']!),
                    ),
                    title: Text(
                      update['name']!,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      update['time']!,
                      style: TextStyle(color: Colors.white70),
                    ),
                    onTap: () {
                      // Handle onTap event if needed
                    },
                  );
                },
              )

            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Viewed Updates",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 171,),
                  IconButton(
                    icon: Icon(
                      showViewedUpdates ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        showViewedUpdates = !showViewedUpdates;
                      });
                    },
                  ),
                ],
              ),
            ),
            Visibility(
              visible: showViewedUpdates,
              child: SizedBox(
                height: 300, // Adjust the height based on your content
                child: ListView.builder(
                  itemCount: viewedUpdates.length,
                  itemBuilder: (context, index) {
                    final update = viewedUpdates[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(update['image']!),
                      ),
                      title: Text(
                        update['name']!,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        update['time']!,
                        style: TextStyle(color: Colors.white70),
                      ),
                      onTap: () {
                        // Handle onTap event if needed
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0.25,
            right: 20,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Handle pen icon action
                    },
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.black),
                    onPressed: () {
                      // Handle camera icon action
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
