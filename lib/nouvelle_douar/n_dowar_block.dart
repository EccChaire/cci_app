

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../services/loc_service.dart';

class NewDowarBlock extends GetxController{
  String dowarName = "";


  void setDowarName(String value){
    dowarName = value;
  }

  void saveNewInterval(Position currentPosition){
    IntervalService().createCoordinateInterval(currentPosition);
  }  



}