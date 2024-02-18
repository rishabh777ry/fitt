import 'package:flutter/material.dart';

// import 'ml.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<YogaPose> yogaPoses = [];

  bool isModelDownloaded = false; // Track model download status

  @override
  void initState() {
    super.initState();
    yogaPoses = [
      YogaPose(
          title: 'Sun Salutation',
          image: 'assets/logo.png',
          modification: 'Hold plank for 5 seconds'),
      YogaPose(
          title: 'Downward-Facing Dog',
          image: 'assets/logo.png',
          modification: 'Keep heels slightly lifted'),
    ];
  }

  // Method to handle model download

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              for (final pose in yogaPoses) YogaPoseCard(pose: pose),
              SizedBox(
                  height: 20), // Add some space between yoga poses and button

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class YogaPose {
  final String title;
  final String image;
  final String? modification;

  YogaPose({required this.title, required this.image, this.modification});
}

class YogaPoseCard extends StatelessWidget {
  final YogaPose pose;

  const YogaPoseCard({required this.pose});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(pose.image),
          Text(pose.title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          if (pose.modification != null)
            Text(pose.modification!,
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
