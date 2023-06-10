import 'package:cci_app/sound-test/sound-bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreenWidget extends StatelessWidget {
   TestScreenWidget({super.key});

  final SoundBloc _soundBloc = Get.put(SoundBloc());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle
            ),
            child:  Icon(
              _soundBloc.isRecording.value? Icons.play_arrow: Icons.stop,
              color: _soundBloc.isRecording.value? Colors.red: Colors.green
            ),
          ),
          onPressed: (){
            _soundBloc.isRecording.value?  _soundBloc.stopRecording():  _soundBloc.startRecording();
          },
        ),
      ),
    );
  }
}