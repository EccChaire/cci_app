


import 'dart:io';

import 'package:cci_app/models/local_media.dart';
import 'package:get/get.dart';

import '../../models/media.dart';

class MediaConroller extends GetxController {

  var mediaType = "".obs;
  var mediaDescription = "".obs;

  File? mediaFile ;


  


  void setMediaType(newMediaType){
    mediaType.value = newMediaType;
  }

  void setMediaDescription(newMediaDescription){
    mediaDescription.value = newMediaDescription;
  }

  void setMediaFile(newMediaFile){
    mediaFile = newMediaFile;
  }


  LocalMedia createLocalMedia(){
    LocalMedia localMedia = LocalMedia();
    localMedia.description = mediaDescription.value;
    localMedia.type = mediaType.value;
    localMedia.file = mediaFile;

    return  localMedia;

  }

  


}