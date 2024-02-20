import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile section
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(130, 141, 251, 1.0),
                        ),
                      ),
                      Text(
                        'smrth sahu',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Center(
                child: Text(
              'Fitness Overview',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'Today',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
            SizedBox(
              height: 10,
            ),
            CircularPercentIndicator(
              radius: 90,
              lineWidth: 13,
              progressColor: Colors.green,
              percent: 0.4,
              circularStrokeCap: CircularStrokeCap.round,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.directions_run_outlined,
                    color: Colors.green,
                    size: 45,
                  ),
                  Text(
                    '0',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Goal 1000',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 40,
                width: double.infinity,
                // padding: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[100]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You are just '),
                    Text(
                      '0 steps',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    Text(' from your goal!')
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Calories',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20)),
                            border: Border.all(color: Colors.black),
                            color: Colors.black87),
                        child: Icon(
                          Icons.local_fire_department,
                          color: Colors.pink,
                          size: 45,
                        ),
                      ),
                      Text('0 KCL',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Active',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20)),
                            border: Border.all(color: Colors.black),
                            color: Colors.black87),
                        child: Icon(
                          Icons.run_circle_outlined,
                          color: Colors.greenAccent,
                          size: 45,
                        ),
                      ),
                      Text('0 min',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'SpO2',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20)),
                            border: Border.all(color: Colors.black),
                            color: Colors.black87),
                        child: Icon(
                          Icons.water_drop,
                          color: Colors.deepPurpleAccent,
                          size: 45,
                        ),
                      ),
                      Text('97%',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Stress',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20)),
                            border: Border.all(color: Colors.black),
                            color: Colors.black87),
                      ),
                      Text('62%',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),

            // Cards section (now displayed vertically)
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     BuildCard(name: 'Steps', icon:Icons.directions_walk),
            //     SizedBox(height: 10.0),
            //     BuildCard(name: 'Calories', icon:Icons.local_fire_department),
            //   ],
            // ),
          ],
        ),
      ),
    ));
  }
}
