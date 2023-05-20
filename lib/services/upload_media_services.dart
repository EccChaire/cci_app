import 'dart:io';

import 'package:cci_app/login/login_repository.dart';
import 'package:cci_app/models/media.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../utils/database_roots.dart';

class UploadMediaService {
  Future<void> saveMedia(
      File file, String mediaType, String mediaDescription) async {
    Media media = Media();

    media.mediaType = mediaType;
    media.mediaDescription = mediaDescription;

    switch (mediaType) {
      case 'image':
        media.mediaUrl = await uploadFile(file, 'images');
        break;
      case 'video':
        media.mediaUrl = await uploadFile(file, 'videos');
        break;
      case 'audio':
        media.mediaUrl = await uploadFile(file, 'videos');
    }

    media.uploaderId = await LoginRepository().getConnectedUserId();
    media.dowarId = "Position";

    final docRef = DatabaseRoutes.QUESTION_DATABASES.doc();
    media.mediaId = double.parse(docRef.id)
        .toString(); // Set questionId to the Firestore document ID
    final Map<String, dynamic> data = media.toJson();
    await docRef.set(data);
  }

  Future<String> uploadFile(File file, String folderName) async {
    String fileName = const Uuid().v4(); // Generate a unique file name
    Reference reference =
        DatabaseRoutes.STORAGE_REFERENCE.child('$folderName/$fileName');
    UploadTask uploadTask = reference.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    // Get the uploaded image URL
    String downloadUrl = await reference.getDownloadURL();

    return downloadUrl;
  }
}
