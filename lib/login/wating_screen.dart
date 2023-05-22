

import 'package:cci_app/login/waiting_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaitingScreen extends StatelessWidget {
  WaitingScreen({super.key});

  final WaitingBlock waitingBlock = Get.put(WaitingBlock());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 16.0),
            Text(
              "Veuillez patienter, nous nous occupons de cette étape",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
