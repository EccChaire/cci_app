import 'package:cci_app/config.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:cci_app/data_space/controllers/media_controller.dart';
import 'package:cci_app/quizz1/quizz_screen.dart';
import 'package:cci_app/quizz3/quizz_screen.dart';
import 'package:cci_app/services/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cci_app/quizz2/quizz_screen.dart';
import 'components/button_widget.dart';
import 'components/quizz_card.dart';
import 'package:cci_app/data_space/Providers/quizz3_provider.dart';
import 'package:cci_app/data_space/Providers/quizz2_provider.dart';
import 'package:cci_app/data_space/Providers/quizz1_provider.dart';
import 'package:cci_app/models/media.dart';
import 'package:cci_app/quizz4/carte_screen.dart';
import 'package:cci_app/services/loc_service.dart';
import 'package:cci_app/services/dowar_services.dart';
import 'package:cci_app/models/question.dart';
import 'package:cci_app/services/question_service.dart';


class DataSpace extends StatelessWidget {
  String ? DowarID ;
  List<Question> questions = [] ;


  final QuestionService QS = Get.put(QuestionService());
  final IntervalService IS = Get.put(IntervalService());
  final DowarService DS = Get.put(DowarService());
  DataSpeceController dataSpaceConroller = Get.find<DataSpeceController>();
  final uploadImage uploadjpg = Get.put(uploadImage());
  final uploadVideo uploadmp4 = Get.put(uploadVideo());
  final uploadAudio uploadmp3 = Get.put(uploadAudio());
  final MediaConroller mediaConroller = Get.put(MediaConroller());
  final DataSpeceController dataSpeceController = Get.put(DataSpeceController());
  TextProvider textProvider = TextProvider();
  ValueProvider valueProvider = ValueProvider();
  ChoicesProvider choicesProvider = ChoicesProvider();
  String path = '';




  DataSpace({super.key});

  @override
  Widget build(BuildContext context) {
    String Description = '';
    Media md;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0F8A74),
          title: const Text('Espace des données'),
          // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        ),
        body: ListView(

      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        Row(

          children: [
SizedBox(width: getProportionateScreenWidth(10)),
          QuizzCard(
            cardTitle: "Données générales",
            cardDescription: "Vous devez inserer ici toutes les données générales du cette dowar",
            onClockFuction: () async {
              DowarID = await DS.retrieveDowarID(await IS.isDouarExist());
              questions = await QS.getQuestionsByType("A");
              Get.to(() => Q1Page(Dowarid : DowarID, questions: questions));
            },
          ),
         SizedBox(width: getProportionateScreenWidth(15)),
          QuizzCard(
            cardTitle: "Données spécifiques",
            cardDescription: "noter de 1 à 5 les acteurs suivants",
            onClockFuction: () async {
              DowarID = await DS.retrieveDowarID(await IS.isDouarExist());
              questions = await QS.getQuestionsByType("B");
              Get.to(() => Q2Page(Dowarid : DowarID, questions: questions));
            },
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
        ]),
        SizedBox(height: getProportionateScreenHeight(20)),
        Row(
          children: [
              SizedBox(width: getProportionateScreenWidth(10)),
            QuizzCard(
              cardTitle: "Mesure de l’émergence",
              cardDescription: "Vous trouvez ici les 9 dimensions de mesure de l’émergence",
              onClockFuction: () async {
                DowarID = await DS.retrieveDowarID(await IS.isDouarExist());
                //questions = await QS.getQuestionsByType("C");
                Get.to(() => Q3Page(Dowarid : DowarID));
              },
            ),
              SizedBox(width: getProportionateScreenWidth(15)),
            QuizzCard(
              cardTitle: "Ressources locales",
              cardDescription: "Ici vous pouvez des ressources locales pour ce dowar",
              onClockFuction: () async {
                DowarID = await DS.retrieveDowarID(await IS.isDouarExist());
                //Get.to(() => WebViewExample());
              },
            ),

          ],
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(10)),
            QuizzCard(
              cardTitle: "Acteurs de l’émergence",
              cardDescription: "Ici vous pouvez des acteurs de l'émergence de ce dowar",
              onClockFuction: () async {
                DowarID = await DS.retrieveDowarID(await IS.isDouarExist());
                //Get.to(() => WebViewExample());
              },
            ),
            SizedBox(width: getProportionateScreenWidth(15)),
            QuizzCard(
              cardTitle: "Infrastructures de base",
              cardDescription: "Ici vous pouvez ajouter les infrastructures de base dans le dowar",
              onClockFuction: () async {
                DowarID = await DS.retrieveDowarID(await IS.isDouarExist());
                //Get.to(() => WebViewExample());
              },
            ),

          ],
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(10)),
            QuizzCard(
              cardTitle: "Projets communautaires",
              cardDescription: "Ici vous pouvez ajouter les projets communautaires dans le dowar",
              onClockFuction: () async {
                DowarID = await DS.retrieveDowarID(await IS.isDouarExist());
                //Get.to(() => Q3Page(Dowarid : DowarID));
              },
            ),
            SizedBox(width: getProportionateScreenWidth(15)),
            QuizzCard(
              cardTitle: "Cartographie",
              cardDescription: "Vous trouvez ici la cartographie KUMU",
              onClockFuction: () {
                Get.to(() => WebViewExample());
              },
            ),

          ],
        ),

         SizedBox(height: getProportionateScreenHeight(10)),
        Row(
          children: [
             SizedBox(width: getProportionateScreenWidth(10)),
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
                                  uploadjpg.openCamera();
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
                                  uploadmp4.recordvideo();
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
                        onPressed: () async {
                          try {
                            uploadjpg.uploadimage(context);
                            md = await mediaConroller.createMedia(Description,"image", uploadjpg.mediaurl);
                            dataSpaceConroller.saveMedia(md);
                            Navigator.pop(context);
                          } catch (e) {
                            uploadmp4.uploadvideo(context);
                            md = await mediaConroller.createMedia(Description,"video", uploadmp4.mediaurl);
                            dataSpaceConroller.saveMedia(md);
                            Navigator.pop(context);
                          }

                        })
                  ],

                ));
          }),
           SizedBox(width: getProportionateScreenWidth(15)),
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
                                child: Obx(
                                  () => Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle
                                    ),
                                    child:  Icon(
                                        uploadmp3.isRecording.value? Icons.play_arrow: Icons.stop,
                                        color: uploadmp3.isRecording.value? Colors.red: Colors.green
                                    ),
                                  ),
                                ),
                                onPressed: () async{
                                  uploadmp3.isRecording.value?  uploadmp3.stopRecording():  uploadmp3.startRecording();

                                },
                              ),
                            ],
                            )
                          ],
                        )
                      ),

                      TextButton(
                          child: Text("OK", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF0F8A74) , fontSize: 11)),
                          onPressed: () async{
                            uploadmp3.uploadaudio(context);
                            md = await mediaConroller.createMedia(Description,"audio", uploadmp3.mediaurl);
                            dataSpaceConroller.saveMedia(md);
                              Navigator.pop(context);
                        })
                    ],

                  ));
          }),
        ]),
        SizedBox(height: getProportionateScreenHeight(30)),
        Center(
          child: ButtonWidget(
            buttonLable: "Soumettre",
            buttonOnClickFunction: () async{
              await dataSpeceController.saveDataToFirebase();
              await dataSpeceController.deleteCash();
              textProvider.clearAllInstances();
              valueProvider.clearAllInstances();
              choicesProvider.clearAllInstances();

            },
          ),
        )
      ],
    ));
  }
}

