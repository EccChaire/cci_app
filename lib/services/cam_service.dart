import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhotoService {
  final picker = ImagePicker();

  Future<File?> takePhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
  Future<File?> recordVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<void> savefile(File file) async {
    // Implement your logic to save the photo file
  }
}
