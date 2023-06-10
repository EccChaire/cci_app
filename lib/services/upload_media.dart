import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class uploadImage {
  bool isImageTaken = false;
  String imagePath = '';
  String mediaurl = '';

  Future<void> openCamera() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imagePath = image.path;
      isImageTaken = true;
    }
  }
  Future<void> uploadimage(BuildContext context) async {
    final File file = File(imagePath);
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference reference = storage.ref().child(
        'images/${DateTime.now()}.jpg');

    try {
      mediaurl = await reference.putFile(file).toString();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded to Firebase Storage!'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image. Please try again.'))
      );
    }
  }

}



class uploadVideo {
  bool isvideoTaken = false;
  String videoPath = '';
  String mediaurl = '';

  Future<void> recordvideo() async {
    final imagePicker = ImagePicker();
    final video = await imagePicker.pickVideo(source: ImageSource.camera);

    if (video != null) {
      videoPath = video.path;
      isvideoTaken = true;
    }
  }

  Future<void> uploadvideo(BuildContext context) async {
    final File file = File(videoPath);
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference reference = storage.ref().child(
        'videos/${DateTime.now()}.mp4');

    try {
      mediaurl = await reference.putFile(file).toString();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded to Firebase Storage!'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image. Please try again.'))
      );
    }
  }

}



class uploadAudio {
  String mediaurl = '';

  Future<void> uploadaudio(BuildContext context, String AudioPath) async {
    final File file = File(AudioPath);
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference reference = storage.ref().child(
        'audios/${DateTime.now()}.mp3');

    try {
      mediaurl = await reference.putFile(file).toString();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded to Firebase Storage!'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image. Please try again.'))
      );
    }
  }

}


