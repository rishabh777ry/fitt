import 'package:fit_bit/activity.dart';
import 'package:fit_bit/analysis.dart';
import 'package:fit_bit/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'circularsteps.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    FirstScreen(),
    AnalysisScreen(),
    ActivityScreen(),
    Text('Profile'),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pranic Balance'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body:  Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: Color.fromRGBO(130, 141, 251, 1),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.black),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),

    );
  }




}

class StepCounter {
  Stream<StepCount>? get stepCountStream => _stepCountStream;
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;

  void initStepCounter() {
    _stepCountStream = Pedometer.stepCountStream;

    _stepCountStream.listen((StepCount event) {
      _steps = event.steps;
    });
  }

  int getSteps() {
    return _steps;
  }
}


class BuildBody extends StatefulWidget {
  const BuildBody({super.key});

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
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

            // Progress section
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '22%',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Completed',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.battery_charging_full,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ],
              ),
            ),

            // Wave Fury section
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wave Fury',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  ),
                ],
              ),
            ),

            // Complete Profile section
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Complete Your Profile',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Add more details for personalised analysis and tracking',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Details'),
                  ),
                ],
              ),
            ),

            // Fitness Overview section
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fitness Overview',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'TODAY',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Cards section (now displayed vertically)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BuildCard(name: 'Steps', icon:Icons.directions_walk),
                SizedBox(height: 10.0),
                BuildCard(name: 'Calories', icon:Icons.local_fire_department),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCard extends StatefulWidget {
  final icon;
  final name;
  const BuildCard({super.key, required this.icon, required this.name});

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  StepCounter _stepCounter = StepCounter();

  @override
  void initState() {
    super.initState();
    _stepCounter.initStepCounter();
  }

  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 90.0,
              ),
              SizedBox(height: 10.0),
              Text(
                widget.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              StreamBuilder<StepCount>(
                stream: _stepCounter.stepCountStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          '${snapshot.data!.steps}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        CircularStepIndicator(steps: snapshot.data!.steps),
                      ],
                    );
                  } else {
                    return Text(
                      'Loading...',
                      style: TextStyle(fontSize: 16.0),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );;
  }
}

