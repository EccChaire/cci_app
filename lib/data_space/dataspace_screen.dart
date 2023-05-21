import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:cci_app/data_space/controllers/media_controller.dart';
import 'package:cci_app/quizz1/quizz_screen.dart';
import 'package:cci_app/quizz3/quizz_screen.dart';
import 'package:cci_app/services/micro_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cci_app/quizz2/quizz_screen.dart';

import '../services/cam_service.dart';
import 'components/button_widget.dart';
import 'components/quizz_card.dart';

class DataSpace extends StatelessWidget {
  final MediaConroller mediaConroller = Get.put(MediaConroller());
  // Responsecontroller responsecontroller = Get.put(Responsecontroller());
  final DataSpeceController dataSpeceController = Get.put(DataSpeceController());

  DataSpace({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(

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
          ButtonWidget(buttonLable: "Camera", buttonOnClickFunction: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Veuillez inserer Le type et le description du média"),
                  actions: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextField(
                        onChanged: (value) {mediaConroller.setMediaDescription(value);},
                        //controller: mail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          hintText: 'Description ...',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextField(
                        onChanged: (value) {mediaConroller.setMediaType(value);},
                        //controller: mail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                        labelText: 'type',
                        hintText: 'video ou photo',
                        ),
                      ),
                    ),
                    TextButton(
                        child: Text("ok"),
                        onPressed: () => Navigator.pop(context))
                  ],

                ));
            PhotoService().takePhoto();
          }),
          ButtonWidget(buttonLable: "Micro", buttonOnClickFunction: () async{ await AudioService().recordAudio();}),
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

