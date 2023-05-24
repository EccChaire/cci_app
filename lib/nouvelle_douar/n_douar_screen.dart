import 'package:cci_app/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';

import 'n_dowar_block.dart';

class N_douarPage extends StatelessWidget {

  final Position currentPosition;

  final NewDowarBlock newDowarBlock = Get.put(NewDowarBlock());

  N_douarPage({super.key, required this.currentPosition});

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
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Nom',
          hintText: 'Entrer le nom',
        ),
      ),
    );
  }

  Widget _buildcollecteButton() {
    return Container(
        padding:  EdgeInsets.only(top: getProportionateScreenHeight(350)), // set padding to move button to top left corner
        child: ElevatedButton(
          onPressed: () {
            newDowarBlock.saveDowar();
            Get.to(() => DataSpace());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>( Size(getProportionateScreenWidth(250), getProportionateScreenHeight(50))), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
          child: const Text("Collecte",textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
        ));
  }
}