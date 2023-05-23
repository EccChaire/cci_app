

import 'package:cci_app/models/dowar.dart';
import 'package:cci_app/services/dowar_services.dart';
import 'package:cci_app/models/intervale.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:cci_app/data_space/controllers/interval_controller.dart';
import '../services/loc_service.dart';
import 'package:uuid/uuid.dart';

class NewDowarBlock extends GetxController{
  String dowarName = "";
  CoordinateInterval? coordinateInterval;



  void setDowarName(String value){
    dowarName = value;
  }


  saveDowar(){
    Dowar dowar = Dowar();
    dowar.douwarId = const Uuid().v4();
    dowar.dowarName = dowarName;
    dowar.intervalId = coordinateInterval!.intervalId;
    DowarService().saveDowar(dowar);
  }



}