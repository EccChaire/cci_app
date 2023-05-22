import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class audioService {
  Future RecordAudio() async {

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted){
      throw RecordingPermissionException('Microphone permission denied.');
    }
    await FlutterSoundRecorder().openRecorder();
  }
}