import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class NextScreen extends StatefulWidget {
  final List<String> selectedOptions;

  NextScreen({required this.selectedOptions});

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  List<String> _outputData = [];
  bool _isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    // Call the model code to run inference
    runInference(widget.selectedOptions);
  }

  Future<void> runInference(List<String> selectedOptions) async {
    try {
      // Preprocess the selected options
      var binaryData = preprocessData(selectedOptions);

      // Load the TFLite model
      await Tflite.loadModel(
        model: "assets/yoga.tflite",
      );

      // Run inference on the preprocessed data
      var outputData = await Tflite.runModelOnBinary(binary: binaryData);

      // Handle the output data
      handleOutputData(outputData!);
    } catch (e) {
      print("Failed to run inference: $e");
    }
  }

  // Preprocess the selected options
  Uint8List preprocessData(List<String> selectedOptions) {
    // Serialize the list of strings into a single string
    var concatenatedOptions = selectedOptions.join(',');

    // Convert the string to bytes
    var byteData = Uint8List.fromList(concatenatedOptions.codeUnits);
    return byteData;
  }

  void handleOutputData(List outputData) {
    setState(() {
      _outputData = outputData.map((value) => value.toString()).toList();
      _isLoading = false; // Set loading state to false when inference is done
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: SingleChildScrollView(
        // Wrap the column with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selected options: ${widget.selectedOptions}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Output Data:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            _isLoading
                ? Center(
                    child:
                        CircularProgressIndicator(), // Show loading indicator
                  )
                : ListView.builder(
                    shrinkWrap: true, // Add this line
                    physics: NeverScrollableScrollPhysics(), // Add this line
                    itemCount: _outputData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_outputData[index]),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
