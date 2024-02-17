import 'package:flutter/material.dart';

class HeightWeightMeterScreen extends StatefulWidget {
  @override
  _HeightWeightMeterScreenState createState() =>
      _HeightWeightMeterScreenState();
}

class _HeightWeightMeterScreenState extends State<HeightWeightMeterScreen> {
  double _height = 170.0; // Initial height in centimeters
  double _weight = 60.0; // Initial weight in kilograms
  bool _isCalculateEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Height & Weight Meter'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Height'),
                Text('${_height.toStringAsFixed(1)} cm'),
              ],
            ),
            SizedBox(height: 10.0),
            _buildRoller(
              context,
              minValue: 100.0,
              maxValue: 220.0,
              divisions: 120, // 1 cm increments
              label: '$_height cm',
              onChanged: (newHeight) {
                setState(() {
                  _height = newHeight;
                  _isCalculateEnabled =
                      true; // Enable calculate button only if selected
                });
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Weight'),
                Text('${_weight.toStringAsFixed(1)} kg'),
              ],
            ),
            SizedBox(height: 10.0),
            _buildRoller(
              context,
              minValue: 30.0,
              maxValue: 150.0,
              divisions: 120, // 1 kg increments
              label: '$_weight kg',
              onChanged: (newWeight) {
                setState(() {
                  _weight = newWeight;
                  _isCalculateEnabled =
                      true; // Enable calculate button only if selected
                });
              },
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: _isCalculateEnabled
                  ? () {
                      // Handle calculation based on height and weight (e.g., BMI)
                      // Show result in a dialog or new screen
                      print('Height: $_height cm, Weight: $_weight kg');
                    }
                  : null,
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoller(
    BuildContext context, {
    required double minValue,
    required double maxValue,
    required int divisions,
    required String label,
    required Function(double) onChanged,
  }) {
    return Container(
      height: 180.0, // Specify container height
      child: RotatedBox(
        quarterTurns: 3, // Rotate to horizontal layout
        child: ListWheelScrollView.useDelegate(
          physics: FixedExtentScrollPhysics(), // Disable bouncing
          itemExtent: 40.0, // Item height
          diameterRatio: 1.5, // Adjust roller size
          perspective: 0.001, // Set a small positive value for perspective
          onSelectedItemChanged: (int index) {
            onChanged(minValue + index.toDouble());
          },
          childDelegate: ListWheelChildLoopingListDelegate(
            children: List.generate(
              divisions + 1, // Add 1 for the initial value
              (index) => Center(
                child: Text(
                  '${minValue + index.toDouble()}${index == divisions ? '' : '.0'}', // Add decimal only for non-whole numbers
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
