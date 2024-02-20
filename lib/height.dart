import 'package:flutter/material.dart';
import 'home.dart'; // Import the home screen file

class HeightWeightMeterScreen extends StatefulWidget {
  @override
  _HeightWeightMeterScreenState createState() =>
      _HeightWeightMeterScreenState();
}

class _HeightWeightMeterScreenState extends State<HeightWeightMeterScreen> {
  double _height = 170.0; // Initial height in centimeters
  double _weight = 60.0; // Initial weight in kilograms
  int _age = 25; // Initial age
  bool isCalculateEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Height, Weight & Age Meter'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Height section
            buildSection('Height', 100, 200, (index) {
              _height = (index + 100).toDouble();
            }, 'cm'),

            // Weight section
            buildSection('Weight', 30, 150, (index) {
              _weight = (index + 30).toDouble();
            }, 'kg'),

            // Age section
            buildSection('Age', 1, 100, (index) {
              _age = index + 10;
            }, 'years'),

            // Next button
            SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isCalculateEnabled
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }
                    : null,
                icon: Icon(Icons.arrow_forward),
                label: Text('Next', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, int minValue, int maxValue,
      ValueChanged<int> onChanged, String unit) {
    return Column(
      children: [
        SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 150,
              width: 200,
              child: ListWheelScrollView(
                itemExtent: 50,
                physics: FixedExtentScrollPhysics(),
                children: List.generate(
                  maxValue - minValue + 1,
                  (index) => Center(
                    child: Text(
                      '${index + minValue} $unit',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    onChanged(index + minValue);
                    isCalculateEnabled = true;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
