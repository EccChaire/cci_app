

import 'package:cci_app/collecte/collecte_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:cci_app/models/intervale.dart';
import 'package:cci_app/services/dowar_services.dart';
import '../nouvelle_douar/n_douar_screen.dart';
import '../services/loc_service.dart';

class WaitingBlock extends GetxController {
  var isLoading = false.obs;
  IntervalService _intervalService = IntervalService();

  void checkPosition() async {
    isLoading.value = true;
    Position currentPosition = await _intervalService.getCurrentLocation();

    String positionExist = await _intervalService.isDouarExist();
    if (positionExist != ''){
      isLoading.value = false;
      Get.off(()=> CollectePage());
    }else{
      Get.off(()=> N_douarPage(currentPosition : currentPosition));
    }

  }


  WaitingBlock(){
    checkPosition();
  }
}