import 'dart:math';
import 'package:flutter/material.dart';

class YogaPosturesList extends StatefulWidget {
  @override
  _YogaPosturesListState createState() => _YogaPosturesListState();
}

class _YogaPosturesListState extends State<YogaPosturesList> {
  final List<String> yogaPostures = [
    'Adho Mukha Svanasana',
    'Adho Mukha Virksasana',
    'Bakasana',
    'Chandra Namaskar',
    'Dhanurasana',
    'Pranayama',
    'Savasana',
    'Setu Bandhasana',
    'Sirsasana',
    'Surya Namaskar',
    'Tadasana',
    'Trikonasana',
    'Ustrasana',
    'Vrikshasana',
  ];

  String _selectedYogaPosture1 = '';
  String _selectedYogaPosture2 = '';

  @override
  void initState() {
    super.initState();
    _selectRandomYogaPostures();
  }

  void _selectRandomYogaPostures() {
    final Random random = Random();
    final int randomNumber1 = random.nextInt(yogaPostures.length);
    int randomNumber2;
    do {
      randomNumber2 = random.nextInt(yogaPostures.length);
    } while (randomNumber1 == randomNumber2);

    setState(() {
      _selectedYogaPosture1 = yogaPostures[randomNumber1];
      _selectedYogaPosture2 = yogaPostures[randomNumber2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Postures'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _selectedYogaPosture1,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/${_selectedYogaPosture1}.jpeg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _selectedYogaPosture2,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/${_selectedYogaPosture2}.jpeg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
