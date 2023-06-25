import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cci_app/models/ Infrastructures_de_base.dart';
import 'package:cci_app/config.dart';
import 'package:cci_app/ Infrastructures de base/picker.dart';


class AddInfrastructurePage extends StatefulWidget {
  final String? DowarId;
  final String? infId;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isExpanded;
  TextEditingController infrastructureController = TextEditingController();
  TextEditingController disponibleController = TextEditingController();
  TextEditingController qualite_percueController =
  TextEditingController();
  TextEditingController suffisantController = TextEditingController();
  TextEditingController etatController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController encoursController = TextEditingController();

  AddInfrastructurePage({
    required this.DowarId,
    required this.isExpanded,
    required this.infrastructureController,
    required this.etatController,
    required this.qualite_percueController,
    required this.suffisantController,
    required this.disponibleController,
    required this.distanceController,
    required this.encoursController,
    this.infId
  });

  @override
  _AddInfrastructurePageState createState() => _AddInfrastructurePageState();
}

class _AddInfrastructurePageState extends State<AddInfrastructurePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DataSpeceController DS = Get.put(DataSpeceController());
  final List<String> infrastructureList = ['Electricité', 'Eau pour irrigation', 'Eau potable', 'Eau courante dans les foyers','Réseau GSM','Réseau Internet','Préscolaire','Ecole primaire','Collège','Lycée','Formations techniques','Internat','Route d’accès','Dispensaire/infirmerie','Hôpital','Centre maternel','Pharmacie','Ambulance','Dar Talib','Dar Chabab','Dar Attakafa','Souk hebdomadaire','Sports et jeunesse','Mosquée','Autre : '];
  final List<String> ONList = ['Oui', 'Non'];
  final List<String> ETList = ['Individuel', 'collectif', 'communautaire', 'service public'];
  final List<String> QPList = ['TB', 'B', 'M', 'F','TF'];

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

              widget.infrastructureController.text = widget.infrastructureController.text;
              widget.disponibleController.text = widget.disponibleController.text;
              widget.qualite_percueController.text =
                  widget.qualite_percueController.text;
              widget.suffisantController.text = widget.suffisantController.text;
              widget.etatController.text =
                  widget.etatController.text;
              widget.encoursController.text = widget.encoursController.text;
              widget.distanceController.text = widget.distanceController.text;

            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(30),right:getProportionateScreenWidth(30)),
            duration: Duration(milliseconds: 300),
            width: 400,
            height: widget.isExpanded ? 470 : 70,
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
                        "Ajouter un infrastructure de base",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(12)),
                      TextField(
                        controller: widget.infrastructureController,
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
                                options: infrastructureList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.infrastructureController.text = selectedValue;
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
                        controller: widget.disponibleController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Disponible ...',
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyPickerWidget(
                                options: ONList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.disponibleController.text = selectedValue;
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
                        controller: widget.qualite_percueController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: ' Qualité perçue...',
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyPickerWidget(
                                options: QPList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.qualite_percueController.text = selectedValue;
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
                        controller: widget.suffisantController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: ' Suffisant aux besoins...',
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyPickerWidget(
                                options: ONList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.suffisantController.text = selectedValue;
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
                        controller: widget.etatController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'etat...',
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyPickerWidget(
                                options: ETList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.etatController.text = selectedValue;
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
                        controller: widget.distanceController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Distance ...',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.encoursController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Projets en cours ou planifiés ...',
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyPickerWidget(
                                options: ONList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.encoursController.text = selectedValue;
                                    });
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0F8A74), // Set the background color
                          ),
                          onPressed: () {
                            if (isEditing) {
                              // Perform edit action
                              DS.saveInfrastructure(Infrastructure(
                                  infrastructureId:  widget.infId!,
                                  infrastructure: widget.infrastructureController.text,
                                  Disponible: widget.disponibleController.text,
                                  qualite_percue: widget.qualite_percueController.text,
                                  Suffisant: widget.suffisantController.text,
                                  etat: widget.etatController.text,
                                  dowarId: widget.DowarId!,
                                  userId: auth.currentUser?.uid ?? "defaultUserId",
                                  encours: widget.encoursController.text,
                                  distance : widget.distanceController.text,
                              ));
                            } else {
                              // Perform add action
                              DS.saveInfrastructure(Infrastructure(
                                infrastructureId:  const Uuid().v4().toString(),
                                infrastructure: widget.infrastructureController.text,
                                Disponible: widget.disponibleController.text,
                                qualite_percue: widget.qualite_percueController.text,
                                Suffisant: widget.suffisantController.text,
                                etat: widget.etatController.text,
                                dowarId: widget.DowarId!,
                                userId: auth.currentUser?.uid ?? "defaultUserId",
                                encours: widget.encoursController.text,
                                distance : widget.distanceController.text,
                              ));
                            }
                                  setState(() {
                              if (widget.isExpanded) {
                              // Save the entered values when expanding the container
                              widget.infrastructureController.text = widget.infrastructureController.text;
                              widget.disponibleController.text = widget.disponibleController.text;
                              widget.qualite_percueController.text =
                              widget.qualite_percueController.text;
                              widget.suffisantController.text = widget.suffisantController.text;
                              widget.etatController.text =
                              widget.etatController.text;
                              widget.encoursController.text = widget.encoursController.text;
                              widget.distanceController.text = widget.distanceController.text;
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
                        widget.infrastructureController.text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(15)),
                      Text(
                        widget.disponibleController.text,
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
