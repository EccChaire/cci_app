import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cci_app/models/Projets_communautaires.dart';
import 'package:cci_app/config.dart';

class AddProjetPage extends StatefulWidget {
  final String? DowarId;
  bool isExpanded;
  TextEditingController projetController = TextEditingController();
  TextEditingController descriptifController = TextEditingController();
  TextEditingController ActeursimpController =
  TextEditingController();
  TextEditingController resultatController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  AddProjetPage({
    required this.DowarId,
    required this.isExpanded,
    required this.projetController,
    required this.startDateController,
    required this.ActeursimpController,
    required this.resultatController,
    required this.descriptifController,
    required this.endDateController
  });

  @override
  _AddProjetPageState createState() => _AddProjetPageState();
}

class _AddProjetPageState extends State<AddProjetPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DataSpeceController DS = Get.put(DataSpeceController());
  // Define variables for the form fields


  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.isExpanded = !widget.isExpanded;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(30),right:getProportionateScreenWidth(30)),
            duration: Duration(milliseconds: 300),
            width: 400,
            height: widget.isExpanded ? 420 : 70,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.isExpanded)
                  Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          "Ajouter un projet communautaire",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(12)),
                        TextField(
                          controller: widget.projetController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // replace with desired color
                            hintText: 'Projet ...',
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        TextField(
                          controller: widget.descriptifController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Description ...',
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        TextField(
                          controller: widget.ActeursimpController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Acteurs impliqués ...',
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        TextField(
                          controller: widget.resultatController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Résultat ... ...',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        TextField(
                          controller: widget.startDateController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Date de début ...',
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        TextField(
                          controller: widget.endDateController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Date de fin ...',
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0F8A74), // Set the background color
                            ),
                            onPressed:() {
                              DS.saveProjet(Projet(
                                  projetId:  const Uuid().v4().toString(),
                                  projet: widget.projetController.text,
                                  descriptif: widget.descriptifController.text,
                                  Acteursimp: widget.ActeursimpController.text,
                                  resultat: widget.resultatController.text,
                                  startDate: widget.startDateController.text,
                                  endDate: widget.endDateController.text,
                                  dowarId: widget.DowarId!,
                                  userId: "test"
                              ));
                              setState(() {
                                if (widget.isExpanded) {
                                  // Save the entered values when expanding the container
                                  widget.projetController.text = widget.projetController.text;
                                  widget.descriptifController.text = widget.descriptifController.text;
                                  widget.ActeursimpController.text =
                                      widget.ActeursimpController.text;
                                  widget.resultatController.text = widget.resultatController.text;
                                  widget.startDateController.text =
                                      widget.startDateController.text;
                                  widget.endDateController.text =
                                      widget.endDateController.text;
                                }
                                widget.isExpanded = !widget.isExpanded;
                                isEditing = !isEditing;
                              });

                              // Define the action to be performed when the button is pressed
                            },
                            child: Text(
                              "Ajouter",
                            )
                        )

                      ]),
                if(!widget.isExpanded)
                  Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(5)),
                        Text(
                          widget.projetController.text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),
                        Text(
                          widget.descriptifController.text,
                          style: TextStyle(fontSize: 12),
                        ),
                      ])
              ],
            ),
          ),
        ),
      ),
    );
  }

}
