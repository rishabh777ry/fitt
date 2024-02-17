import 'package:flutter/services.dart';

class FirebaseMLService {
  static const MethodChannel _channel = MethodChannel('firebase_ml_service');

  static Future<void> downloadModel() async {
    try {
      await _channel.invokeMethod('downloadModel');
    } on PlatformException catch (e) {
      print('Failed to download model: ${e.message}');
    }
  }
}
