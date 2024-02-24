import 'dart:math';
import 'package:fit_bit/globle.dart';
import 'package:flutter/material.dart';

class YogaPosturesList extends StatefulWidget {
  @override
  _YogaPosturesListState createState() => _YogaPosturesListState();
}

class _YogaPosturesListState extends State<YogaPosturesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Postures'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardForYoaga(data: 0),
              SizedBox(height: 20),
              CardForYoaga(data: 1),
              SizedBox(height: 20),
              CardForYoaga(data: 2),
              SizedBox(height: 20),
              CardForYoaga(data: 3),
              SizedBox(height: 20),
            
            ],
          ),
        ),
      ),
    );
  }
}

class CardForYoaga extends StatelessWidget{
  final int data;
  CardForYoaga(
    {
      required this.data
    }
  );
  @override
  Widget build(BuildContext context) {

    return   Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      responseData['data'][data],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/aasan/${responseData['data'][data]}.jpeg',
                      // 'assets/vrikshasana.jpeg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
  }

}
