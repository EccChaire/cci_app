

import 'package:cci_app/models/media.dart';
import 'package:cci_app/services/response_service.dart';
import 'package:get/get.dart';

import '../../models/local_media.dart';
import '../../models/intervale.dart';

import 'package:cci_app/models/responce.dart' as resp;

import '../../services/upload_media_services.dart';

class DataSpeceController extends GetxController {
  
  var responses = <resp.Response>[].obs;
  var localMedia = <LocalMedia>[].obs;
  var medias = <Media>[].obs;
  var intervals = <CoordinateInterval>[].obs;

  void saveMedia(Media media) {
    medias.add(media);
  }

  void saveResponse(resp.Response response) {
    int existingIndex = responses.indexWhere((r) => r.questionId == response.questionId);

    if (existingIndex != -1) {
      // Update existing response
      responses[existingIndex] = response;
    } else {
      // Add new response
      responses.add(response);
    }
  }
  void saveInterval(CoordinateInterval interval){
    intervals.add(interval);
  }

  

  Future<String> saveDataToFirebase() async{
    for(Media md in medias){
      await UploadMediaService().save_media(md);
    }

    for(resp.Response respon in responses){
      ResponseService().saveResponse(respon);
    }



    return 'done';

  }
  Future<String> deleteCash() async{
    responses.clear();
    localMedia.clear();
    return 'done';
  }

}
