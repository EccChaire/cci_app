

import 'package:cci_app/models/dowar.dart';
import 'package:cci_app/services/dowar_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../models/intervale.dart';
import '../services/loc_service.dart';
import 'package:uuid/uuid.dart';

class NewDowarBlock extends GetxController{
  String dowarName = "";
  CoordinateInterval? coordinateInterval;



  void setDowarName(String value){
    dowarName = value;
  }

  void saveNewInterval(Position currentPosition){
    coordinateInterval = IntervalService().createCoordinateInterval(currentPosition);
  }  


  saveDowar(){
    Dowar dowar = Dowar();
    dowar.douwarId = const Uuid().v4();
    dowar.dowarName = dowarName;
    dowar.intervalId = coordinateInterval!.intervalId;
    DowarService().saveDowar(dowar);
  }



}