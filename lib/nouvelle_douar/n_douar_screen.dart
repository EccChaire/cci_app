import 'package:cci_app/config.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/collecte/collecte_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:cci_app/login/waiting_block.dart';
import 'package:cci_app/models/intervale.dart';
import 'package:cci_app/services/loc_service.dart';

import 'n_dowar_block.dart';

class N_douarPage extends StatelessWidget {

  final Position currentPosition;

  final NewDowarBlock newDowarBlock = Get.put(NewDowarBlock());
  final IntervalService intervalservice = Get.put(IntervalService());


  N_douarPage({super.key, required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: ListView(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            SizedBox(height: getProportionateScreenHeight(100)),
            const Center(
              child: Text("Cette localisation n'est pas dans notre Base de données. Merci d'indiquer le nom de ce village:",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF0F8A74), fontSize: 24 )),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            _buildnameTextField(),
            _buildcollecteButton()
          ],
        ),
        ]),
    );
  }
  String Dname ='';
  Widget _buildnameTextField() {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (text) {
          Dname = text;
        },
        decoration: InputDecoration(
          labelText: 'Nom',
          hintText: 'Entrer le nom',
        ),
      ),
    );
  }

  Widget _buildcollecteButton() {
    return Container(
        padding:  EdgeInsets.only(top: getProportionateScreenHeight(250)), // set padding to move button to top left corner
        child: ElevatedButton(
          onPressed: () async{

            CoordinateInterval currentInterval = await intervalservice.newInterval(currentPosition);
            intervalservice.saveInterval(currentInterval);
            newDowarBlock.saveDowar(currentInterval.intervalId!, Dname);
            Get.to(() => CollectePage());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(250, 50)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
          child: const Text("Continuer",textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
        ));
  }
}