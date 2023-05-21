


import 'package:get/get.dart';

import '../../models/media.dart';

class MediaConroller extends GetxController {

  var mediaType = "".obs;
  var mediaDescription = "".obs;

  var mediaFile = "".obs;


  


  void setMediaType(newMediaType){
    mediaType.value = newMediaType;
  }

  void setMediaDescription(newMediaDescription){
    mediaDescription.value = newMediaDescription;
  }

  void setMediaFile(newMediaFile){
    mediaFile.value = newMediaFile;
  }

  


}