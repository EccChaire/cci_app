import 'package:cci_app/config.dart';
import 'package:cci_app/models/question.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/quizz3/QCM.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';
import 'package:cci_app/models/responce.dart' as resp;

import '../data_space/controllers/data_space_controller.dart';
import '../data_space/controllers/resonse_controller.dart';


class Q3Page extends StatefulWidget {
  final String ? Dowarid;
  Q3Page({super.key, required this.Dowarid});

  @override
  _Q3PageState createState() => _Q3PageState();
}

class _Q3PageState extends State<Q3Page> {
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  List<Question> questions = [Question(questionId :5, questionType: "A",questionCorp:"Comment t'as trouvé le douar"),Question(questionId :6, questionType: "A",questionCorp:"Comment t'as trouvé le douar")];
  
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();
  Map<String, double> _selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  ListView(
              children: [
                Row(
                    children: [
                      _buildbackButton(),
                    ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var index= 0; index<questions.length; index = index+1 ) ...[
                      ChooseTwoInOrderQuestion(question: questions[index], Dowarid: widget.Dowarid),
                       SizedBox(height: getProportionateScreenHeight(10)),

                    ]
                  ],
                ),
              ]),
        );
  }



  Widget _buildbackButton() {
    return  Container(
        padding: EdgeInsets.only( left : getProportionateScreenWidth(10), top: getProportionateScreenHeight(20)),
        child: TextButton(
          onPressed: () async{
            //for (var index= 0; index<questions.length; index = index+1 ){
              //resp.Response resposne = await responsecontroller.createNewResponse(questions[index].questionId.toString(), responses[index].toString(), 'dowarid');
              //dataSpeceController.saveResponse(resposne);
            //};
            Get.to(() => DataSpace());
            // Perform some action here
          },
          child: Text('Retour', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
        )
    );
  }
}
