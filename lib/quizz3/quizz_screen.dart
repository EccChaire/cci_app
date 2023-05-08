import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/quizz3/QCM.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';


class Q3Page extends StatefulWidget {
  @override
  _Q3PageState createState() => _Q3PageState();
}

class _Q3PageState extends State<Q3Page> {
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
                    ChooseTwoInOrderQuestion(question: "Comment t'a trouvé ce douar?"),
                    const SizedBox(height: 10),
                    ChooseTwoInOrderQuestion(question: "Cmment t'a trouvé ce douar?"),
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
          onPressed: () {
            // Perform some action here
          },
          child: Text('Enregistrer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
        ));
  }
}
