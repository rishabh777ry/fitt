import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class YogaPosturesList extends StatefulWidget {
  @override
  _YogaPosturesListState createState() => _YogaPosturesListState();
}

class _YogaPosturesListState extends State<YogaPosturesList> {
  List<YogaPosture> yogaPostures = [];

  @override
  void initState() {
    super.initState();
    fetchYogaPostures();
  }

  void fetchYogaPostures() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('yoga').doc('images').get();

    Map<String, dynamic> data = snapshot.data()!;
    List<YogaPosture> fetchedYogaPostures = [];

    data.forEach((key, value) {
      fetchedYogaPostures.add(
        YogaPosture(
          name: value['name'],
          muscleGroup: value['muscleGroup'],
          image: value['image'],
          description: value['description'],
        ),
      );
    });

    // Shuffle the list of yoga postures
    fetchedYogaPostures.shuffle();

    setState(() {
      yogaPostures = fetchedYogaPostures;
    });
  }

  @override
  Widget build(BuildContext context) {
    return yogaPostures.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: yogaPostures.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: YogaPostureCard(yogaPosture: yogaPostures[index]),
              );
            },
          );
  }
}

class YogaPosture {
  final String name;
  final String muscleGroup;
  final String image;
  final String description;

  YogaPosture({
    required this.name,
    required this.muscleGroup,
    required this.image,
    required this.description,
  });
}

class YogaPostureCard extends StatelessWidget {
  final YogaPosture yogaPosture;

  YogaPostureCard({required this.yogaPosture});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              yogaPosture.image,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  yogaPosture.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Target Muscle Group: ${yogaPosture.muscleGroup}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  yogaPosture.description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
