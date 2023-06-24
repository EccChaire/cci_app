import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cci_app/models/Acteurs_de_l’émergence.dart';
import 'package:cci_app/config.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:cci_app/Acteurs de l’émergence/picker.dart';

class AddActeurPage extends StatefulWidget {
  final String? DowarId;
  bool isExpanded;
  TextEditingController acteurController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController roleController =
  TextEditingController(text: 'Intégrateur');
  TextEditingController depuisController = TextEditingController();


  AddActeurPage({
    required this.DowarId,
    required this.isExpanded,
    required this.acteurController,
    required this.roleController,
    required this.depuisController,
    required this.typeController,
  });

  @override
  _AddResourcePageState createState() => _AddResourcePageState();
}

class _AddResourcePageState extends State<AddActeurPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DataSpeceController DS = Get.put(DataSpeceController());
  final List<String> roleList = ['Intégrateur', 'Leader institutionnel', 'Faiseur', 'Catalyseur','Facilitateur'];
  String? rl;
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
            height: widget.isExpanded ? 320 : 70,
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
                        "Ajouter un acteur de l'émergence",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(12)),
                      TextField(
                        controller: widget.acteurController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // replace with desired color
                          hintText: 'Acteur ...',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.typeController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Type ...',
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      TextField(
                        controller: widget.roleController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'role ...',
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return MyPickerWidget(
                                options: roleList,
                                onItemSelected: (selectedValue) {
                                  if (selectedValue != null) {
                                    setState(() {
                                      widget.roleController.text = selectedValue;
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
                        controller: widget.depuisController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Depuis ...',
                        ),
                        onTap: () {
                          showStartDatePickerDialog();

                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(8)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0F8A74), // Set the background color
                          ),
                          onPressed:() {
                            DS.saveActeur(Acteur(
                                acteurId:  const Uuid().v4().toString(),
                                acteur: widget.acteurController.text,
                                type: widget.typeController.text,
                                role: widget.roleController.text,
                                depuis: widget.depuisController.text,
                                dowarId: widget.DowarId!,
                                userId: "test"
                            ));
                            setState(() {
                              if (widget.isExpanded) {
                                // Save the entered values when expanding the container
                                widget.acteurController.text = widget.acteurController.text;
                                widget.typeController.text = widget.typeController.text;
                                widget.roleController.text =
                                    widget.roleController.text;
                                widget.depuisController.text = widget.depuisController.text;
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
                        widget.acteurController.text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(15)),
                      Text(
                        widget.roleController.text,
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
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  void showStartDatePickerDialog() async {
    final DateTime? selectedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF0F8A74), // Customize primary color
            accentColor: Colors.green, // Customize accent color
            colorScheme: ColorScheme.light(
              primary: Color(0xFF0F8A74), // Customize primary color
              onPrimary: Colors.white, // Customize text color on primary color
              surface: Colors.white, // Customize background color
              onSurface: Colors.black, // Customize text color on background color
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
    if (selectedStartDate != null) {
      String formattedDate = _dateFormat.format(selectedStartDate);
      setState(() {
        widget.depuisController.text = formattedDate;
      });
    }
  }
  }

