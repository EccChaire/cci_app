import 'package:cci_app/collecte/collecte_screen.dart';
import 'package:cci_app/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:cci_app/data_space/controllers/resonse_controller.dart';
import 'package:provider/provider.dart';
import 'package:cci_app/models/question.dart';
import 'package:cci_app/data_space/Providers/quizz2_provider.dart';
import 'package:cci_app/data_space/controllers/double_Edditing_Controller.dart';
import 'package:cci_app/models/responce.dart' as resp;
import 'package:cci_app/services/loc_service.dart';
import 'package:cci_app/services/dowar_services.dart';

class MetricInterface extends StatefulWidget {
  final Question question;
  final String ? Dowarid;


  MetricInterface({
    required this.question,
    required this.Dowarid
  });



  @override
  _MetricInterfaceState createState() => _MetricInterfaceState();
}

class _MetricInterfaceState extends State<MetricInterface> {
  final IntervalService IS = Get.put(IntervalService());
  final CollectePage CP = Get.put(CollectePage());
  final DowarService DS = Get.put(DowarService());
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();

  @override
  Widget build(BuildContext context) {
    final valueProvider = Provider.of<ValueProvider>(context);
    final valueControllers = <String, DoubleEditingController>{};
    //final content = TextEditingController(text: textProvider.enteredText);
    valueProvider.enteredValueMap.forEach((fieldId, value) {
      valueControllers[fieldId] = DoubleEditingController(initialValue: value);
    });
    String fieldId = widget.question.questionId.toString();
    if (valueControllers[fieldId] == null) {
      valueProvider.updateValue(fieldId, 3.0);
    };
    double _currentValue = valueControllers[fieldId]?.value ?? 3.0;


    return Container(
       margin:EdgeInsets.only(left:getProportionateScreenWidth(12)),
        padding: EdgeInsets.only(left: getProportionateScreenWidth(30),right:getProportionateScreenWidth(30), top:getProportionateScreenHeight(getProportionateScreenWidth(30))),
        width: getProportionateScreenWidth(400),
        height: getProportionateScreenHeight(160),
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
                    Text(widget.question.questionCorp.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                          value: valueControllers[fieldId]?.value ?? 3.0,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          activeColor: Colors.green,
                          inactiveColor: Colors.white,

                          onChanged: (double value) async{
                            resp.Response rp = await responsecontroller.createNewResponse(widget.question.questionId.toString(), value.toString(), widget.Dowarid!);
                            dataSpeceController.saveResponse(rp);
                            setState(() {
                             _currentValue = value;
                             valueProvider.updateValue(fieldId, value);
                        });
                      },


              ),
                    )]
          )]
        )],
    ),
    );

  }

}

