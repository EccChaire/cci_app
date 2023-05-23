import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';

import '../data_space/controllers/data_space_controller.dart';
import '../data_space/controllers/resonse_controller.dart';
import 'package:cci_app/models/responce.dart' as resp;
import 'package:cci_app/quizz1/block.dart';

class Q1Page extends StatelessWidget {

  final String questionId = "QuestionId";
  List<String> questions = ["question1", "question2"];

  
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
              children: [
                Row(
                  children: [
                    _buildbackButton(),
                    _buildsaveButton(),
                  ]),
                Column(
                  children: [
                    for (var index= 0; index<questions.length; index = index+1 ) ...[
                      writeResponse(question: questions[index]),
                      const SizedBox(height: 10),
                    ]
                  ],
                )


              ]),
    );
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


        // Perform some action here
          },
          child: Text('Enregistrer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
        ));
  }
}
