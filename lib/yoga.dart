import 'package:flutter/material.dart';
import 'model.dart';
import 'card.dart';

class MCQScreen extends StatefulWidget {
  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {
  List<String> _selectedOptions = [];

  // Questions organized by category
  Map<String, List<String>> questions = {
    'Yoga Practices and Techniques': [
      'savasana',
      'pranayama',
      'tadasana',
      'dhanurasana',
      'handstand',
      'virabhadrasana'
    ],
    'Body Parts': ['legs', 'arms', 'hips', 'shoulders', 'chest', 'spine'],
    'Health Benefits and Attributes': [
      'flexibility',
      'stability',
      'balance',
      'strength',
      'relaxation',
      'mindfulness'
    ],
    'Other': [
      'promoting',
      'mental',
      'physical',
      'well-being',
      'circulation',
      'metabolism'
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCQ Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: questions.entries.map((entry) {
                    String category = entry.key;
                    List<String> categoryQuestions = entry.value;

                    return buildQuestionList(category, categoryQuestions);
                  }).toList()
                    ..add(SizedBox(height: 16.0))
                    ..add(ElevatedButton(
                      onPressed: () {
                        // Handle the selected options
                        print('Selected options: $_selectedOptions');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YogaPosturesList(),
                          ),
                        );
                      },
                      child: Text('Submit'),
                    )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestionList(String title, List<String> questions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Column(
          children: questions
              .map(
                (question) => Row(
                  children: [
                    Checkbox(
                      value: _selectedOptions.contains(question),
                      onChanged: (checked) {
                        setState(() {
                          if (checked == true && _selectedOptions.length < 5) {
                            _selectedOptions.add(question);
                          } else if (checked == false) {
                            _selectedOptions.remove(question);
                          }
                        });
                      },
                    ),
                    Text(question),
                  ],
                ),
              )
              .toList(),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
