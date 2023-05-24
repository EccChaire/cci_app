import 'package:cci_app/config.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:cci_app/data_space/controllers/media_controller.dart';
import 'package:cci_app/services/upload_media_services.dart';
import 'package:cci_app/quizz1/quizz_screen.dart';
import 'package:cci_app/quizz3/quizz_screen.dart';
import 'package:cci_app/models/local_media.dart';
import 'package:cci_app/services/micro_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cci_app/quizz2/quizz_screen.dart';

import '../services/cam_service.dart';
import 'components/button_widget.dart';
import 'components/quizz_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataSpace extends StatelessWidget {
  DataSpeceController dataSpaceConroller = Get.find<DataSpeceController>();

  final MediaConroller mediaConroller = Get.put(MediaConroller());
  // Responsecontroller responsecontroller = Get.put(Responsecontroller());
  final DataSpeceController dataSpeceController = Get.put(DataSpeceController());



  DataSpace({super.key});

  @override
  Widget build(BuildContext context) {
    String Description = '';
    LocalMedia md;

    return Scaffold(
        body: ListView(

      children: [
        SizedBox(height: 40.h),
        Row(children: [
          QuizzCard(
            cardTitle: "Enquête 1",
            cardDescription: "C’est notre premier enquête qui contient toutes que tu dois répondre manuellement.",
            onClockFuction: () {
              Get.to(() => Q1Page());
            },
          ),
          QuizzCard(
            cardTitle: "Enquête 2",
            cardDescription: "C’est la deuxième enquête qui contient toutes les domaine qui peut être gradié de un à cinq.",
            onClockFuction: () {
              Get.to(() => Q2Page());
            },
          ),
        ]),
        Row(
          children: [
            QuizzCard(
              cardTitle: "Enquête 3",
              cardDescription: "C’est notre troisième enquête qui contient toutes question à multiple choix.",
              onClockFuction: () {
                Get.to(() => Q3Page());
              },
            ),
            QuizzCard(
              cardTitle: "Enquête 4",
              cardDescription: "Cette enquête est réservé pour ma deuxième donc il vas contient toutes les questions relié à la cartographie.",
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
                  title: Text("Veuillez inserer la description du média"),
                  actions: [
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24.0)),
                      child: Column(
                        children: [
                          TextField(
                            onSubmitted: (text) async{
                                Description = text;
                            },
                            //controller: mail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Description',
                              hintText: 'Description ...',
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(40)),
                          Row(
                            children: [
                              ElevatedButton(
                                child: const Text("image",textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                                onPressed: () async{

                                  md = mediaConroller.createLocalMedia(Description , "image", await PhotoService().takePhoto());
                                  dataSpaceConroller.saveMedia(md);
                                  UploadMediaService().uploadFile(md.file!, "images");
                                },

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
                                  minimumSize: MaterialStateProperty.all<Size>(Size(getProportionateScreenWidth(125), getProportionateScreenHeight(50))), // set minimum size
                                  // You can also use fixedSize property to set the exact button size
                                ),
                              ),
                              SizedBox(width:getProportionateScreenWidth(10)),
                              ElevatedButton(
                                child: const Text("Vidéo",textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                                onPressed: () async{

                                      md = mediaConroller.createLocalMedia(Description , "video", await PhotoService().recordVideo());
                                      dataSpaceConroller.saveMedia(md);
                                      UploadMediaService().uploadFile(md.file!, "videos");
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
                                  minimumSize: MaterialStateProperty.all<Size>(Size(getProportionateScreenWidth(125), getProportionateScreenHeight(50))), // set minimum size
                                  // You can also use fixedSize property to set the exact button size
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                    TextButton(
                        child: Text("OK", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF0F8A74) , fontSize: 11)),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],

                ));
          }),
          ButtonWidget(buttonLable: "Micro", buttonOnClickFunction: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Veuillez inserer la description du média"),
                    actions: [
                      Container(
                        padding:  EdgeInsets.symmetric(horizontal:getProportionateScreenHeight(15.0) ),
                        child: Column(
                          children: [
                            TextField(
                              onSubmitted: (text) async{
                                Description = text;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Description',
                                hintText: 'Description ...',
                                ),
                              ),
                            SizedBox(height: getProportionateScreenHeight(40)),
                            Row(
                            children: [
                              ElevatedButton(
                                child: const Text("Audio",textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                                onPressed: () async{

                                  md = mediaConroller.createLocalMedia(Description , "audio", await audioService().RecordAudio(),);
                                  dataSpaceConroller.saveMedia(md);
                                  UploadMediaService().uploadFile(md.file!, "audios");
                                },

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
                                  minimumSize: MaterialStateProperty.all<Size>(Size(getProportionateScreenWidth(125), getProportionateScreenHeight(50))), // set minimum size
                                  // You can also use fixedSize property to set the exact button size
                                ),
                              ),
                            ],
                            )
                          ],
                        )
                      ),
                      TextButton(
                          child: Text("OK", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF0F8A74) , fontSize: 11)),
                          onPressed: () => Navigator.pop(context))
                    ],

                  ));
          }),
        ]),
        Center(
          child: ButtonWidget(
            buttonLable: "Envoyer",
            buttonOnClickFunction: () async{
              await dataSpeceController.saveDataToFirebase();
              await dataSpeceController.deleteCash();
            },
          ),
        )
      ],
    ));
  }
}

