import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cci_app/models/ Infrastructures_de_base.dart';
import 'package:cci_app/config.dart';

class AddInfrastructurePage extends StatefulWidget {
  final String? DowarId;
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
    required this.encoursController
  });

  @override
  _AddInfrastructurePageState createState() => _AddInfrastructurePageState();
}

class _AddInfrastructurePageState extends State<AddInfrastructurePage> {
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
                          fillColor: Colors.white, // replace with desired color
                          hintText: 'Infrastructure ...',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.disponibleController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'disponible ...',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.qualite_percueController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Qualité perçue',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.suffisantController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Suffisant aux besoins ...',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.etatController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'etat ...',
                        ),
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
                          hintText: 'en cours ou planifié ...',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0F8A74), // Set the background color
                          ),
                          onPressed:() {
                            DS.saveInfrastructure(Infrastructure(
                                infrastructureId:  const Uuid().v4().toString(),
                                infrastructure: widget.infrastructureController.text,
                                Disponible: widget.disponibleController.text,
                                qualite_percue: widget.qualite_percueController.text,
                                Suffisant: widget.suffisantController.text,
                                etat: widget.etatController.text,
                                dowarId: widget.DowarId!,
                                userId: "test",
                                encours: widget.encoursController.text,
                                distance : widget.distanceController.text,
                            ));
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
