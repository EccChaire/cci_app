import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cci_app/data_space/dataspace_screen.dart';

class CollectePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Center(
              child: Text("Bienvenue Test USR, Merci pour ton collaboration",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF0F8A74), fontSize: 36 )),
              ),
              _buildcollecteButton()
          ],
        ));
  }
  Widget _buildcollecteButton() {
    return Container(
        padding: EdgeInsets.only(top: 350.h), // set padding to move button to top left corner
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