import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cci_app/models/Ressource_local.dart';
import 'package:cci_app/config.dart';
import 'package:cci_app/Resource Local/picker.dart';

class AddResourcePage extends StatefulWidget {
  final String? DowarId;
  final String? resId;
  bool isExpanded;
  TextEditingController ressourceController = TextEditingController();
  TextEditingController descriptifController = TextEditingController();
  TextEditingController communautaireOrIndividuelleController =
  TextEditingController();
  TextEditingController nbreCitationsController = TextEditingController();
  TextEditingController projetsExploitentController = TextEditingController();

  AddResourcePage({
    required this.DowarId,
    required this.isExpanded,
    required this.ressourceController,
    required this.projetsExploitentController,
    required this.communautaireOrIndividuelleController,
    required this.nbreCitationsController,
    required this.descriptifController,
    this.resId
  });

  @override
  _AddResourcePageState createState() => _AddResourcePageState();
}

class _AddResourcePageState extends State<AddResourcePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DataSpeceController DS = Get.put(DataSpeceController());
  final List<String> choiceList = ['Communautaire', 'individuelle'];

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
              isEditing = true;

              widget.ressourceController.text = widget.ressourceController.text;
              widget.descriptifController.text = widget.descriptifController.text;
              widget.communautaireOrIndividuelleController.text =
                  widget.communautaireOrIndividuelleController.text;
              widget.nbreCitationsController.text = widget.nbreCitationsController.text;
              widget.projetsExploitentController.text =
                  widget.projetsExploitentController.text;

            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(30),right:getProportionateScreenWidth(30)),
            duration: Duration(milliseconds: 300),
            width: 400,
            height: widget.isExpanded ? 370 : 70,
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
                        "Ajouter une ressource local",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(12)),
                      TextField(
                        controller: widget.ressourceController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // replace with desired color
                          hintText: 'Resource ...',
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
                        controller: widget.communautaireOrIndividuelleController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Infrastructure de base ...',
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyPickerWidget(
                                options: choiceList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.communautaireOrIndividuelleController.text = selectedValue;
                                    });
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.nbreCitationsController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Number of Citations ...',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.projetsExploitentController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Projects Exploiting ...',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0F8A74), // Set the background color
                          ),

                          onPressed: () {
                            if (isEditing) {
                              // Perform edit action
                              DS.saveResource(Resource(
                                ressourceId:  widget.resId!,
                                ressource: widget.ressourceController.text,
                                descriptif: widget.descriptifController.text,
                                CommunautaireORindividuelle: widget.communautaireOrIndividuelleController.text,
                                nbreCitations: widget.nbreCitationsController.text,
                                projetsExploitent: widget.projetsExploitentController.text,
                                dowarId: widget.DowarId!,
                                userId: auth.currentUser?.uid ?? "defaultUserId",
                              ));
                            } else {
                              // Perform add action
                              DS.saveResource(Resource(
                                ressourceId:  const Uuid().v4().toString(),
                                ressource: widget.ressourceController.text,
                                descriptif: widget.descriptifController.text,
                                CommunautaireORindividuelle: widget.communautaireOrIndividuelleController.text,
                                nbreCitations: widget.nbreCitationsController.text,
                                projetsExploitent: widget.projetsExploitentController.text,
                                dowarId: widget.DowarId!,
                                userId: auth.currentUser?.uid ?? "defaultUserId",
                              ));
                            }
                            setState(() {
                              if (widget.isExpanded) {
                                // Save the entered values when expanding the container
                                widget.ressourceController.text = widget.ressourceController.text;
                                widget.descriptifController.text = widget.descriptifController.text;
                                widget.communautaireOrIndividuelleController.text =
                                    widget.communautaireOrIndividuelleController.text;
                                widget.nbreCitationsController.text = widget.nbreCitationsController.text;
                                widget.projetsExploitentController.text =
                                    widget.projetsExploitentController.text;
                              }
                              widget.isExpanded = !widget.isExpanded;
                              isEditing = !isEditing;
                            });
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
                        widget.ressourceController.text,
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
