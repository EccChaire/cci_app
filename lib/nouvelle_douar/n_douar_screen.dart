import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';

class N_douarPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Center(
              child: Text("C'est une nouvelle douar veuillez entrer son nom",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF0F8A74), fontSize: 36 )),
            ),
            _buildnameTextField(),
            _buildcollecteButton()
          ],
        ));
  }
  Widget _buildnameTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'Nom',
          hintText: 'Entrer le nom',
        ),
      ),
    );
  }

  Widget _buildcollecteButton() {
    return Container(
        padding: EdgeInsets.only(top: 350), // set padding to move button to top left corner
        child: ElevatedButton(
          child: const Text("Collecte",textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
          onPressed: () {
            Get.to(() => DataSpace());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
        ));
  }
}