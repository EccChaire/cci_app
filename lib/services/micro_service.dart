import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AudioService {
  static const MethodChannel _channel = MethodChannel('audio_service');

  Future<String?> recordAudio() async {
    String? filePath;
    try {
      final directory = await getTemporaryDirectory();
      filePath = '${directory.path}/recording.aac';
      await _channel.invokeMethod('recordAudio', {'filePath': filePath});
    } catch (e) {
      print('Error recording audio: $e');
    }
    return filePath;
  }

  Future<void> saveAudio(String filePath) async {
    try {
      final File file = File(filePath);
      // Implement your logic to save the audio file
      print('Audio saved: $filePath');
    } catch (e) {
      print('Error saving audio: $e');
    }
  }
}
