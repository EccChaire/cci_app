import 'package:cci_app/config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../data_space/controllers/data_space_controller.dart';
import 'package:cci_app/ Infrastructures de base/add_infrastructure.dart';
import 'package:cci_app/models/ Infrastructures_de_base.dart';


class InfrastructurePage extends StatefulWidget {
  final String? Dowarid;
  InfrastructurePage({required this.Dowarid});

  @override
  _InfrastructurePageState createState() => _InfrastructurePageState();
}

class _InfrastructurePageState extends State<InfrastructurePage> {
  late DataSpeceController DS;
  late List<Infrastructure> infs;
  TextEditingController ICinitial = TextEditingController(text: '');
  TextEditingController DCinitial = TextEditingController(text: '');
  TextEditingController QCinitial = TextEditingController(text: '');
  TextEditingController SCinitial = TextEditingController(text: '');
  TextEditingController ECinitial = TextEditingController(text: '');
  TextEditingController DiCinitial = TextEditingController(text: '');
  TextEditingController EcCinitial = TextEditingController(text: '');
  TextEditingController Coinitial = TextEditingController(text: '');

  @override
  List<Widget> addedWidgets = [SizedBox(height: getProportionateScreenHeight(10))];
  void initState() {
    super.initState();
    DS = Get.put(DataSpeceController());
    infs = DS.infrastructures;
    for(Infrastructure inf in infs){
      TextEditingController IC = TextEditingController(text: inf.infrastructure);
      TextEditingController DC = TextEditingController(text: inf.Disponible);
      TextEditingController QC = TextEditingController(text: inf.qualite_percue);
      TextEditingController SC = TextEditingController(text: inf.Suffisant);
      TextEditingController EC = TextEditingController(text: inf.etat);
      TextEditingController EcC = TextEditingController(text: inf.encours);
      TextEditingController DiC = TextEditingController(text: inf.distance);
      TextEditingController CoC = TextEditingController(text: inf.commentaire);

      String infid = inf.infrastructureId;
      addedWidgets.add(AddInfrastructurePage(DowarId: widget.Dowarid, isExpanded: false, infrastructureController: IC,disponibleController: DC,qualite_percueController: QC, suffisantController: SC, etatController: EC,encoursController: EcC,distanceController: DiC,infId: infid, commentaireController: CoC,));
      addedWidgets.add(SizedBox(height: getProportionateScreenHeight(10)));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F8A74),
        title: Text('Infrastructures'),
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
                  addedWidgets.add(AddInfrastructurePage(DowarId: widget.Dowarid, isExpanded: true, infrastructureController: ICinitial,qualite_percueController: QCinitial,disponibleController: DCinitial,suffisantController: SCinitial,etatController: ECinitial,encoursController: EcCinitial,distanceController: DiCinitial,commentaireController: Coinitial,));
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
