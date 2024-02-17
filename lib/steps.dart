import 'package:pedometer/pedometer.dart';

class StepCounter {
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;

  // Initialize the step counter
  void initStepCounter() {
    _stepCountStream = Pedometer.stepCountStream;

    _stepCountStream.listen((StepCount event) {
      _steps = event.steps;
    });
  }

  // Get the current step count
  int getSteps() {
    return _steps;
  }
}
