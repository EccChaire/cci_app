
import 'package:cci_app/login/login_repository.dart';
import 'package:cci_app/models/responce.dart' as resp;

import 'package:uuid/uuid.dart';

import 'package:get/get.dart';

class Responsecontroller extends GetxController {



  Future<resp.Response> createNewResponse(String questionId, String responseCorp, String dowarId) async{
    resp.Response response = resp.Response();
    response.responseId = const Uuid().v4();
    response.questionId = questionId;
    response.responseCorp = responseCorp;
    response.userId =await LoginRepository().getConnectedUserId();
    response.responseDate = DateTime.now();
    response.dowarId = dowarId;

    return response;


  }
  void UpdateResponse(resp.Response response, String updatecorp) async{
    response.responseCorp = updatecorp;
  }

  
}