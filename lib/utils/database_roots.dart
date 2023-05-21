



// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseRoutes {
  static CollectionReference  USER_DATABASES = FirebaseFirestore.instance.collection('users');
  static CollectionReference  QUESTION_DATABASES = FirebaseFirestore.instance.collection('questions');
  static CollectionReference  RENSPONSE_DATABASES = FirebaseFirestore.instance.collection('responses');
  static CollectionReference  DOWAR_DATABASES = FirebaseFirestore.instance.collection('dowars');
  static CollectionReference  MEDIA_DATABASES = FirebaseFirestore.instance.collection('medias');
  static CollectionReference  INTERVAL_DATABASES = FirebaseFirestore.instance.collection('intervales');


  static Reference STORAGE_REFERENCE = FirebaseStorage.instance.ref();
}