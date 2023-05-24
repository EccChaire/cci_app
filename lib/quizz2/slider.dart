import 'package:cci_app/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cci_app/models/responce.dart' as resp;
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:cci_app/data_space/controllers/resonse_controller.dart';

class MetricInterface extends StatefulWidget {
  List<String> responses;
  final String question;

  MetricInterface({
    required this.responses,
    required this.question
  });



  @override
  _MetricInterfaceState createState() => _MetricInterfaceState();
}

class _MetricInterfaceState extends State<MetricInterface> {
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();
  double _currentValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(30),right:getProportionateScreenWidth(30), top:getProportionateScreenHeight(getProportionateScreenWidth(30))),
        width: getProportionateScreenWidth(400),
        height: getProportionateScreenHeight(130),
        decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        ),
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children : [
                Column(
                  children : [
                    Text(widget.question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Note: $_currentValue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ]
                ),
                Column(
                  children:[
                    SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 5.h,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                        ),
                        child: Slider(
                          value: _currentValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          activeColor: Colors.green,
                          inactiveColor: Colors.white,

                          onChanged: (double value) async{
                            setState(() {
                             _currentValue = value;

                        });
                            widget.responses.add(_currentValue.toString());
                      },


              ),
                    )]
          )]
        )],
    ),
    );

  }

}

