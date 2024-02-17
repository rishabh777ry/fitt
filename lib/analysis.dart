import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat for date formatting

class AnalysisScreen extends StatefulWidget {
  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  // Data models for water intake and workout
  List<WaterIntake> waterIntakeData = [];
  List<Workout> workoutData = [];

  @override
  void initState() {
    super.initState();
    // Initialize data (replace with your logic)
    waterIntakeData = [
      WaterIntake(date: DateTime.now(), amount: 500),
      WaterIntake(
          date: DateTime.now().subtract(Duration(days: 1)), amount: 300),
      // Add more water intake entries
    ];
    workoutData = [
      Workout(date: DateTime.now(), type: 'Running', duration: 30),
      Workout(
          date: DateTime.now().subtract(Duration(days: 2)),
          type: 'Yoga',
          duration: 45),
      // Add more workout entries
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Water intake section
            Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Water Intake',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    // Show weekly average water intake
                    _buildWeeklyAverageText(waterIntakeData),
                    SizedBox(height: 10.0),
                    // Show detailed daily water intake list
                    _buildWaterIntakeList(waterIntakeData),
                  ],
                ),
              ),
            ),

            // Workout section
            SizedBox(height: 20.0),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Weekly Workouts',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    // Show total workout duration for the week
                    _buildTotalWorkoutDurationText(workoutData),
                    SizedBox(height: 10.0),
                    // Show workout summary list (workout type, duration)
                    _buildWorkoutSummaryList(workoutData),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildWeeklyAverageText(List<WaterIntake> waterIntakeData) {
    // Calculate and format weekly average water intake
    double averageIntake = _calculateWeeklyAverageWaterIntake(waterIntakeData);
    return Text(
      'Weekly Average: ${averageIntake.toStringAsFixed(1)} ml',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildWaterIntakeList(List<WaterIntake> waterIntakeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: waterIntakeData.map((intake) {
        return ListTile(
          title: Text(DateFormat('MMM dd').format(intake.date)),
          subtitle: Text('${intake.amount} ml'),
        );
      }).toList(),
    );
  }

  Text _buildTotalWorkoutDurationText(List<Workout> workoutData) {
    // Calculate and format total workout duration for the week
    int totalDuration = _calculateTotalWorkoutDuration(workoutData);
    return Text(
      'Total Duration: $totalDuration minutes',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildWorkoutSummaryList(List<Workout> workoutData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: workoutData.map((workout) {
        return ListTile(
          title: Text(workout.type),
          subtitle: Text('${workout.duration} minutes'),
        );
      }).toList(),
    );
  }

  // Calculate weekly average water intake
  double _calculateWeeklyAverageWaterIntake(List<WaterIntake> waterIntakeData) {
    if (waterIntakeData.isEmpty) return 0.0;
    int totalIntake =
    waterIntakeData.map((intake) => intake.amount).reduce((a, b) => a + b);
    return totalIntake / waterIntakeData.length;
  }

  // Calculate total workout duration for the week
  int _calculateTotalWorkoutDuration(List<Workout> workoutData) {
    if (workoutData.isEmpty) return 0;
    return workoutData
        .map((workout) => workout.duration)
        .reduce((a, b) => a + b);
  }
}

// Data models
class WaterIntake {
  final DateTime date;
  final int amount;

  WaterIntake({required this.date, required this.amount});
}

class Workout {
  final DateTime date;
  final String type;
  final int duration;

  Workout({required this.date, required this.type, required this.duration});
}