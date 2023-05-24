import 'package:cci_app/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cci_app/data_space/controllers/resonse_controller.dart';
import 'package:cci_app/models/responce.dart' as resp;
import '../data_space/controllers/data_space_controller.dart';


class writeResponse extends StatefulWidget {
  final String question;
  List<String> responses;



  writeResponse({
    required this.question,
    required this.responses
  });

  @override
  _writeResponse createState() => _writeResponse();
}

class _writeResponse extends State<writeResponse> {
  Responsecontroller responsecontroller = Get.put(Responsecontroller());
  final DataSpeceController dataSpeceController = Get.find<DataSpeceController>();
  final List<resp.Response> reponses =  [];
  TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(30),right:getProportionateScreenWidth(30), top: getProportionateScreenHeight(20)),
        width: getProportionateScreenWidth(400),
        height: getProportionateScreenHeight(130),
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
            children:  [
              Text( widget.question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

              SizedBox(height: getProportionateScreenHeight(20)),
              _buildReponseField(),


            ])
    );
  }
  String inputValue = '';
  Widget _buildReponseField() {
    return TextField (
        controller:  content,
      onSubmitted: (text)  async{
      setState(() {
        inputValue = text;
      });
      widget.responses.add(content.toString());
        //reponses.add(resposne);
        // Do something with the user input
      },

      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white, // replace with desired color
        hintText: 'Votre réponse ...',
      ),
    );
  }
  //Future<List<resp.Response>> _listReponses() {
    //return rep;
  //}
}




















