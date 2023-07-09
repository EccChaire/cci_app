

import 'package:cci_app/collecte/collecte_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../nouvelle_douar/n_douar_screen.dart';
import '../services/loc_service.dart';
import 'package:cci_app/confirmation/confirm_screen.dart';
import 'package:cci_app/services/dowar_services.dart';

class WaitingBlock extends GetxController {
  var isLoading = false.obs;
  final IntervalService IS = Get.put(IntervalService());
  final DowarService DS = Get.put(DowarService());

  void checkPosition() async {
    isLoading.value = true;
    Position currentPosition = await IS.getCurrentLocation();

    String positionExist = await IS.isDouarExist();
    String Dowarname = await DS.retrieveDowarname(await IS.isDouarExist());
    Get.off(()=> N_douarPage(currentPosition : currentPosition));
    if (positionExist != ''){
      isLoading.value = false;
      Get.off(()=> ConfirmPage(Dname: Dowarname,));
    }else{
      Get.off(()=> N_douarPage(currentPosition : currentPosition));
    }


  }


  WaitingBlock(){
    checkPosition();
  }
}