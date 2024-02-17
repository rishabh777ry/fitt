import 'package:flutter/material.dart';
import 'height.dart';

class MainGoalSelectionScreen extends StatefulWidget {
  @override
  _MainGoalSelectionScreenState createState() =>
      _MainGoalSelectionScreenState();
}

class _MainGoalSelectionScreenState extends State<MainGoalSelectionScreen> {
  String? selectedGoal;
  bool isNextEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What is your main goal?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGoal = 'Build Muscle';
                      isNextEnabled = true; // Enable the next button
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: selectedGoal == 'Build Muscle'
                          ? Color.fromRGBO(
                              0, 172, 238, 1) // Use an appealing orange color
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: selectedGoal == 'Build Muscle'
                            ? Color.fromRGBO(0, 172, 238,
                                1) // Match border color to background
                            : Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/fit.png', // Replace with your image
                          height: 100.0,
                          width: 250.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Build Muscle',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: selectedGoal == 'Build Muscle'
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGoal = 'Keep Fit';
                      isNextEnabled = true; // Enable the next button
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: selectedGoal == 'Keep Fit'
                          ? Color.fromRGBO(
                              0, 172, 238, 1) // Use an appealing blue color
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: selectedGoal == 'Keep Fit'
                            ? Color.fromRGBO(0, 172, 238,
                                1) // Match border color to background
                            : Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/zumba.png', // Replace with your image
                          height: 100.0,
                          width: 250.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Keep Fit',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: selectedGoal == 'Keep Fit'
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGoal = 'Loose Weight';
                      isNextEnabled = true; // Enable the next button
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: selectedGoal == 'Loose Weight'
                          ? Color.fromRGBO(
                              0, 172, 238, 1) // Use an appealing green color
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: selectedGoal == 'Loose Weight'
                            ? Color.fromRGBO(0, 172, 238,
                                1) // Match border color to background
                            : Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/fatt.png', // Replace with your image
                          height: 100.0,
                          width: 250.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Loose Weight',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: selectedGoal == 'Loose Weight'
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 300, // Width of the button
                  child: ElevatedButton(
                    onPressed: isNextEnabled
                        ? () {
                            // Handle navigation to the next screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HeightWeightMeterScreen(),
                              ),
                            );
                          }
                        : null, // Disable button if no category selected
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
