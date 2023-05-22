

import 'package:cci_app/data_space/dataspace_screen.dart';
import 'package:get/get.dart';

import '../nouvelle_douar/n_douar_screen.dart';
import '../services/loc_service.dart';

class WaitingBlock extends GetxController {
  var isLoading = false.obs;

  void checkPosition() async {
    isLoading.value = true;

    bool positionExist = await IntervalService().isDouarExist();
    if (positionExist){
      isLoading.value = false;
      Get.off(()=> DataSpace());
    }else{
      Get.off(()=> N_douarPage());
    }

  }


  WaitingBlock(){
    checkPosition();
  }
}