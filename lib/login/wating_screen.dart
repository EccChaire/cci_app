

import 'package:cci_app/config.dart';
import 'package:cci_app/login/waiting_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WaitingScreen extends StatelessWidget {
  WaitingScreen({super.key});

  final WaitingBlock waitingBlock = Get.put(WaitingBlock());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F8A74),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const CircularProgressIndicator(),
            SizedBox(height: getProportionateScreenHeight(16)),
            const Text(
              "Veuillez patienter, nous nous occupons de cette étape",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
    );
  }
}