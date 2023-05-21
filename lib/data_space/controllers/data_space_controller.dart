import 'dart:io';

import 'package:cci_app/models/media.dart';
import 'package:cci_app/services/response_service.dart';
import 'package:get/get.dart';

import '../../models/local_media.dart';
import 'package:cci_app/models/responce.dart' as resp;

import '../../services/upload_media_services.dart';

class DataSpeceController extends GetxController {
  
  var responses = <resp.Response>[].obs;
  var localMedia = <LocalMedia>[].obs;

  void saveMedia(LocalMedia media) {
    localMedia.add(media);
  }

  void saveResponse(resp.Response response) {
    responses.add(response);
  }

  

  Future<String> saveDataToFirebase() async{
    for(LocalMedia media in localMedia){
      await UploadMediaService().saveMedia(media);
    }

    for(resp.Response resp in responses){
      ResponseService().saveResponse(resp);
    }

    return 'done';

  }

}
