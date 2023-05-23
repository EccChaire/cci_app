import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/quizz2/slider.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';

import '../data_space/controllers/data_space_controller.dart';
import '../data_space/controllers/resonse_controller.dart';
import 'package:cci_app/models/responce.dart' as resp;


class Q2Page extends StatefulWidget {

  
  @override
  _Q2PageState createState() => _Q2PageState();
}

class _Q2PageState extends State<Q2Page> {
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();
  Map<String, double> _selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
            children: [
              Row(
                children: [
                  _buildbackButton(),
                  _buildsaveButton(),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MetricInterface(question: "Comment t'a trouvé ce douar?"),
                  const SizedBox(height: 10),
                  MetricInterface(question: "Cmment t'a trouvé ce douar?"),
                ],
              ),
            ]),
    ));
  }



  Widget _buildbackButton() {
    return  Container(
        padding: EdgeInsets.only( left : 10, top: 20),
        child: TextButton(
          onPressed: () {
            Get.to(() => DataSpace());
            // Perform some action here
          },
          child: Text('Retour', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
        )
    );
  }
  Widget _buildsaveButton() {
    return  Container(
        padding: EdgeInsets.only(left: 240, top: 20),
        child: TextButton(
          onPressed: () async{

            resp.Response resposne = await responsecontroller.createNewResponse('f','f','f');
            dataSpeceController.saveResponse(resposne);

        // Perform some action here
          },
          child: Text('Enregistrer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
        ));
  }
}
