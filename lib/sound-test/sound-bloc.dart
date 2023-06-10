import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundBloc extends GetxController {
  bool isInitialized = false;
  String? pathToAudio;
  FlutterSoundRecorder? _flutterSoundRecorder;
  var isRecording = false.obs;

  void startRecording() async {
    if (isInitialized) {
      print('.... recording');
      isRecording.value = true;
      await _flutterSoundRecorder!.startRecorder(toFile: pathToAudio);
    } else {
      await init();
      print('.... recording');
      isRecording.value = true;
      await _flutterSoundRecorder!.startRecorder(toFile: pathToAudio);
    }
  }

  void stopRecording() async {
    if (isInitialized) {
      await _flutterSoundRecorder!.stopRecorder();
      isRecording.value = true;
    } else {
      await init();
      await _flutterSoundRecorder!.stopRecorder();
      isRecording.value = true;
    }
  }

  Future init() async {
    _flutterSoundRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Permission was denid');
    }
    await _flutterSoundRecorder!.openRecorder();
    isInitialized = true;
  }

  @override
  void dispose() {
    _flutterSoundRecorder!.closeRecorder();
    _flutterSoundRecorder = null;
    isInitialized = false;
    super.dispose();
  }
}
