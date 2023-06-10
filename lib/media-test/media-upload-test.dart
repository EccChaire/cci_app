import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isImageTaken = false;
  String imagePath = '';

  Future<void> openCamera() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    
    if (image != null) {
      setState(() {
        imagePath = image.path;
        isImageTaken = true;
      });
    }
  }

  Future<void> uploadImage() async {
    final File file = File(imagePath);
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference reference = storage.ref().child('images/${DateTime.now()}.jpg');
    
    try {
      await reference.putFile(file);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image uploaded to Firebase Storage!'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image. Please try again.'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: openCamera,
              child: const Text('Open Camera'),
            ),
            const SizedBox(height: 20),
            isImageTaken
                ? Image.file(
                    File(imagePath),
                    height: 200,
                    width: 200,
                  )
                : const SizedBox(),
            const SizedBox(height: 20),
            isImageTaken
                ? ElevatedButton(
                    onPressed: uploadImage,
                    child: const Text('Upload Image'),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
