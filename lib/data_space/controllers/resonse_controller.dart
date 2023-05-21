
import 'package:cci_app/login/login_repository.dart';
import 'package:cci_app/models/responce.dart' as resp;
import 'package:cci_app/services/Date_service.dart';

import 'package:uuid/uuid.dart';

import 'package:get/get.dart';

class Responsecontroller extends GetxController {
  var questionId = "".obs;
  var responseDesc = "".obs;


  setResponseDesc(String response){
    responseDesc.value = response;
  }

  Future<resp.Response> createNewResponse() async{
    resp.Response response = resp.Response();
    response.responseId = const Uuid().v4();
    response.questionId = questionId.value;
    response.responseDescription = responseDesc.value;
    response.userId =await LoginRepository().getConnectedUserId();
    response.responseDate = DateTime.now();
    response.dowarId = "Dowar Id";

    return response;


  }

  Responsecontroller({required this.questionId});

  
}