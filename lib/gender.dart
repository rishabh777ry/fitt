import 'package:flutter/material.dart';
import 'maingoal.dart';
import 'home.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;
  bool isContinueEnabled =
      false; // Flag to track if the continue button should be enabled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'What\'s your gender?',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            // Wrap the Column in SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Let us know you better!',
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'Male';
                          isContinueEnabled = true; // Enable the button
                        });
                      },
                      child: GenderOption(
                        gender: 'Male',
                        imagePath: 'assets/man.png',
                        selected: selectedGender == 'Male',
                      ),
                    ),
                    SizedBox(height: 50.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'Female';
                          isContinueEnabled = true; // Enable the button
                        });
                      },
                      child: GenderOption(
                        gender: 'Female',
                        imagePath: 'assets/women.png',
                        selected: selectedGender == 'Female',
                      ),
                    ),
                    SizedBox(
                        height:
                            50.0), // Adjust the spacing between the Female button and the Continue button
                    SizedBox(
                      width: 350.0,
                      height: 50, // Make button width fill the screen
                      child: ElevatedButton(
                        onPressed: isContinueEnabled
                            ? () {
                                // Handle gender selection confirmation here
                                print('Selected gender: $selectedGender');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MainGoalSelectionScreen(),
                                  ),
                                );
                              }
                            : null, // Disable button if not enabled
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String gender;
  final String imagePath;
  final bool selected;

  const GenderOption({
    Key? key,
    required this.gender,
    required this.imagePath,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: selected
            ? const Color.fromARGB(255, 174, 219, 255)
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color:
              selected ? const Color.fromARGB(255, 141, 202, 252) : Colors.grey,
          width: 5.0,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 110.0,
            height: 110.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0),
          Text(
            gender,
            style: TextStyle(
              fontSize: 18.0,
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
