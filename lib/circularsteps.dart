import 'package:flutter/material.dart';

class CircularStepIndicator extends StatelessWidget {
  final int steps;

  const CircularStepIndicator({Key? key, required this.steps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 10.0,
            value: steps /
                10000, // Adjust this value to indicate progress (e.g., percentage of goal achieved)
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Text(
            '$steps', // Total steps count
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'Steps', // Label
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
