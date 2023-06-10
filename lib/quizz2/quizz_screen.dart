import 'package:cci_app/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/quizz2/slider.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';

import '../data_space/controllers/data_space_controller.dart';
import '../data_space/controllers/resonse_controller.dart';
import 'package:cci_app/models/responce.dart' as resp;
import 'package:cci_app/models/question.dart';


class Q2Page extends StatefulWidget {



  @override
  _Q2PageState createState() => _Q2PageState();
}

class _Q2PageState extends State<Q2Page> {
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();


  List<Question> questions = [Question(questionId :3, questionType: "A",questionCorp:"Comment t'as trouvé le douar"),Question(questionId :4, questionType: "A",questionCorp:"Comment t'as trouvé le douar")];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
            children: [
              Row(
                children: [
                  _buildbackButton(),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var index= 0; index<questions.length; index = index+1 ) ...[
                    MetricInterface(question: questions[index]),
                     SizedBox(height: getProportionateScreenHeight(10)),

                  ]
                ],

              ),
            ]),
    );
  }



  Widget _buildbackButton() {
    return  Container(
        padding: EdgeInsets.only( left : getProportionateScreenWidth(10), top: getProportionateScreenWidth(20)),
        child: TextButton(
          onPressed: () async{
            Get.to(() => DataSpace());
            // Perform some action here
          },
          child: Text('Retour', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
        )
    );
  }
}
