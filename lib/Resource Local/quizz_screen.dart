import 'package:cci_app/config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../data_space/controllers/data_space_controller.dart';
import 'package:cci_app/Resource Local/add_ressource.dart';
import 'package:cci_app/models/Ressource_local.dart';
import 'package:cci_app/data_space/controllers/data_space_controller.dart';


class ResourcePage extends StatefulWidget {
  final String? Dowarid;
  ResourcePage({required this.Dowarid});

  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  late DataSpeceController DS;
  late List<Resource> ress;
  TextEditingController RCinitial = TextEditingController(text: '');
  TextEditingController DCinitial = TextEditingController(text: '');
  TextEditingController NCinitial = TextEditingController(text: '');
  TextEditingController PCinitial = TextEditingController(text: '');
  TextEditingController CCinitial = TextEditingController(text: '');

  @override
  List<Widget> addedWidgets = [SizedBox(height: getProportionateScreenHeight(10))];
  void initState() {
    super.initState();
    DS = Get.put(DataSpeceController());
    ress = DS.ressources;
    for(Resource rs in ress){
      TextEditingController RC = TextEditingController(text: rs.ressource);
      TextEditingController DC = TextEditingController(text: rs.descriptif);
      TextEditingController NC = TextEditingController(text: rs.nbreCitations);
      TextEditingController PC = TextEditingController(text: rs.projetsExploitent);
      TextEditingController CC = TextEditingController(text: rs.CommunautaireORindividuelle);
      String resid = rs.ressourceId;
      addedWidgets.add(AddResourcePage(DowarId: widget.Dowarid, isExpanded: false, ressourceController: RC, projetsExploitentController: PC,communautaireOrIndividuelleController: CC,nbreCitationsController: NC,descriptifController: DC, resId: resid,));
      addedWidgets.add(SizedBox(height: getProportionateScreenHeight(10)));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F8A74),
        title: Text('Resources locals'),
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
                  addedWidgets.add(AddResourcePage(DowarId: widget.Dowarid, isExpanded: true, ressourceController: RCinitial, projetsExploitentController: PCinitial,communautaireOrIndividuelleController: CCinitial,nbreCitationsController: NCinitial,descriptifController: DCinitial));
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
