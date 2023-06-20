import 'package:cci_app/config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';
import '../data_space/controllers/data_space_controller.dart';
import '../data_space/controllers/resonse_controller.dart';
import 'package:cci_app/models/responce.dart' as resp;
import 'package:cci_app/quizz1/block.dart';
import 'package:cci_app/models/question.dart';

class Q1Page extends StatelessWidget {
  final String ? Dowarid;
  Q1Page({super.key, required this.Dowarid});

  final String questionId = "QuestionId";
  List<Question> questions = [Question(questionId :1, questionType: "A",questionCorp:"Comment t'as trouvé le douar"),Question(questionId :2, questionType: "A",questionCorp:"Comment t'as trouvé le douar")];

  
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
              children: [
                Row(
                  children: [
                    _buildbackButton(context),
                  ]),
                Column(
                  children: [
                    for (var index= 0; index<questions.length; index = index+1 ) ...[
                      writeResponse(question: questions[index], Dowarid: Dowarid),
                       SizedBox(height: getProportionateScreenHeight(10)),
                    ]
                  ],
                )


              ]),
    );
  }



  Widget _buildbackButton(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only( left : getProportionateScreenWidth(10), top: getProportionateScreenHeight(20)),
        child: TextButton(
          onPressed: () {

            Get.to(() => DataSpace());
        // Perform some action here
          },
          child: Text('Retour', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
    )
    );
  }
}
