


import 'dart:io';

import 'package:cci_app/models/local_media.dart';
import 'package:get/get.dart';

import '../../models/media.dart';

class MediaConroller extends GetxController {
  LocalMedia createLocalMedia(String Description, String Type, File? media){
    LocalMedia localMedia = LocalMedia();
    localMedia.description = Description;
    localMedia.type = Type;
    localMedia.file = media;

    return  localMedia;

  }

  


}
