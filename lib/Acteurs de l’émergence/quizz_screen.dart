import 'package:cci_app/config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../data_space/controllers/data_space_controller.dart';
import 'package:cci_app/Acteurs de l’émergence/add_Acteur.dart';
import 'package:cci_app/models/Acteurs_de_l’émergence.dart';


class ActeurPage extends StatefulWidget {
  final String? Dowarid;
  ActeurPage({required this.Dowarid});

  @override
  _ActeurPageState createState() => _ActeurPageState();
}

class _ActeurPageState extends State<ActeurPage> {
  late DataSpeceController DS;
  late List<Acteur> acs;
  TextEditingController ACinitial = TextEditingController(text: '');
  TextEditingController TCinitial = TextEditingController(text: '');
  TextEditingController RCinitial = TextEditingController(text: '');
  TextEditingController DCinitial = TextEditingController(text: '');
  TextEditingController CCinitial = TextEditingController(text: '');

  @override
  List<Widget> addedWidgets = [SizedBox(height: getProportionateScreenHeight(10))];
  void initState() {
    super.initState();
    DS = Get.put(DataSpeceController());
    acs = DS.acteurs;
    for(Acteur ac in acs){
      TextEditingController AC = TextEditingController(text: ac.acteur);
      TextEditingController TC = TextEditingController(text: ac.type);
      TextEditingController RC = TextEditingController(text: ac.role);
      TextEditingController DC = TextEditingController(text: ac.depuis);
      TextEditingController CC = TextEditingController(text: ac.commentaire);
      String actid = ac.acteurId;
      addedWidgets.add(AddActeurPage(DowarId: widget.Dowarid, isExpanded: false, acteurController: AC, typeController: TC, roleController: RC, depuisController: DC, acterId: actid, commentaireController: CC,));
      addedWidgets.add(SizedBox(height: getProportionateScreenHeight(10)));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F8A74),
        title: Text("Acteurs"),
      ),
      body: ListView(
          children: [
            Column(
        children: [
          ...addedWidgets,
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  addedWidgets.add(AddActeurPage(DowarId: widget.Dowarid, isExpanded: true, acteurController: ACinitial, typeController: TCinitial, roleController: RCinitial, depuisController: DCinitial,commentaireController: CCinitial,));
                  addedWidgets.add(SizedBox(height: getProportionateScreenHeight(10)));

                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0F8A74), // Set the background color
              ),
              child: Icon(Icons.add),
            ),
          )
           // Spread operator to add the widgets in the list
        ],
      ),])
    );
  }
}
