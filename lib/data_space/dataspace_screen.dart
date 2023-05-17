import 'package:cci_app/quizz1/quizz_screen.dart';
import 'package:cci_app/quizz3/quizz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cci_app/quizz2/quizz_screen.dart';

import 'components/button_widget.dart';
import 'components/quizz_card.dart';

class DataSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(

      children: [
        SizedBox(height: 40),
        Row(children: [
          QuizzCard(
            cardTitle: "Enquète 1",
            onClockFuction: () {
              Get.to(() => Q1Page());
            },
          ),
          QuizzCard(
            cardTitle: "Enquète 2",
            onClockFuction: () {
              Get.to(() => Q2Page());
            },
          ),
        ]),
        Row(
          children: [
            QuizzCard(
              cardTitle: "Enquète 3",
              onClockFuction: () {
                Get.to(() => Q3Page());
              },
            ),
            QuizzCard(
              cardTitle: "Enquète 4",
              onClockFuction: () {
                Get.to(() => Q3Page());
              },
            ),
          ],
        ),
        Row(children: [
          ButtonWidget(buttonLable: "Camera", buttonOnClickFunction: () {}),
          ButtonWidget(buttonLable: "Micro", buttonOnClickFunction: () {}),
        ]),
        Center(
          child: ButtonWidget(
            buttonLable: "Envoyer",
            buttonOnClickFunction: () {},
          ),
        )
      ],
    ));
  }
}

