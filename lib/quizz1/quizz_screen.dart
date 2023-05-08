import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';

class Q1Page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
              children: [
                Row(
                  children: [
                    _buildbackButton(),
                    _buildsaveButton(),
                  ]),
                Container(
                    padding: EdgeInsets.only(left: 30,right:30, top: 20),
                    width: 400,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children:  [
                        const Center(
                          child: Text("comment t'a trouvé ce douar?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        const SizedBox(height: 20.0),
                        _buildReponseField(),
                      ])
                ),
                const SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.only(left: 30,right:30,top: 10),
                    width: 400,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                        children:  [
                          const Center(
                            child: Text("comment t'a trouvé ce douar?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          const SizedBox(height: 20.0),
                          _buildReponseField(),
                        ])
                )
              ]),
    );
  }

  Widget _buildReponseField() {
    return TextField(
      onChanged: (text) {
        // Do something with the user input
      },
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white, // replace with desired color
        hintText: 'Votre réponse ...',
      ),
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
          onPressed: () {
        // Perform some action here
          },
          child: Text('Enregistrer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Color(0xFF0F8A74))),
        ));
  }
}
