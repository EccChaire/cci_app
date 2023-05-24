import 'package:cci_app/config.dart';
import 'package:flutter/material.dart';
import 'package:cci_app/quizz3/VoirPlusWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class ChooseTwoInOrderQuestion extends StatefulWidget {
  final String question;
  List<List<String>> responses;

  ChooseTwoInOrderQuestion({
    required this.question,
    required this.responses,
  });

  @override
  _ChooseTwoInOrderQuestionState createState() => _ChooseTwoInOrderQuestionState();
}

class _ChooseTwoInOrderQuestionState extends State<ChooseTwoInOrderQuestion> {
  List<String> options = [    'Pré-Émergence',    'Émergence',    'Equilibre',    'Déclin', 'Effondrement', ];
  List<String> Descriptions = [
    "La communauté se trouve dans un environnement géographiquement isolé des centres activité et de decisions. Dans certains cas, elle a choisi de s'isoler des flux de passage autour d'un centre urbain ou semi-urbain proche dans un souci de préservation identitaire ou de son cadre de vie ou de ses pratiques culturelles. Dans les zones isolées par la géographie, il existe des possiblités, et parfois même des projets de désenclavement (routes, transports en commun, .). Dans les communautés isolées, par choix ou par la géographie, des ressources locales exploitables pour s'autonomiser existent et la population maitrise les compétences de base permettant d'en tier profit. Le village dispose des infrastructures de base nécessaires a existence et au développement de futurs projets.",
    "Sous l'impulsion des leaders et avec l'aide de partenaires extérieurs, les infrastructures manquantes (routes, scolaire, santé, réseau, ..) sont peu à peu mises en place soit par les services de Etat soit par la communauté elle-même. Plusieurs projets d'autonomisation fonds sur l'exploitation des ressources naturelles locales afin de répondre aux besoins de la population sont mis en oeuvre et permettent de développer ou de relocaliser des activités vivrières ou génératrices de revenus au sein de la communauté. Les projets de. valorisation des richesses naturelles prennent parfois en compte le renouvellement et 1a durabilité des ressources consommes.",
    "Les voies d'accès existent et permettent quotidiennement l'accès facile de la communauté à l'ensemble des Services publics et privés dont ses membres pourraient avoir besoin (éducation, santé, emplois distants, marchés d'approvisionnement...). Les moyens de transport sont disponibles en nombre suffisant et la fréquence des rotations répond aux besoins courants ou urgents. Peu infrastructures nouvelles sont mises en place (tous les besoins sont couverts) mais celles qui existent sont maintenues, financées, de bonne qualité et restent en bon état de fonctionnement. Un marché local s'est développé qui donne accès à tout un chacun aux biens et aux services produits à l'intérieur de 1a communauté.",
    "l'exploitation non maitrisée des ressources locales s'est traduite par a raréfaction de ces ressources et des confits de propriété ou d'usage ont parfois même éclaté. Les infrastructures qui avaient Été mises en place sont obsolètes, insuffisantes pour couvrir les (nouveaux) besoins. Elles ont parfois même été abandonnées faute de maintenance, de travail collectif pour les entretenir, de formation pour les exploiter, ou de financement. Dans certains cas, usage de ces infrastructures donne lieu a des conflits et la communauté préfère s'en désengager.",
    "La communauté se trouve dans un environnement géographiquement isolé des centres activité et de decision. Cet isolement est perçu comme une barrière au développement. Ces communautés isolées. connaissent mal ou pas du tout les ressources locales exploitables pour s'autonomiser et la population ne maitrise plus les compétences de base permettant d'en tirer profit. Les infrastructures de base: sont tres réduites et ne peuvent pas servir d'appui à de futurs projets de développement.",];
  List<String> selectedOptions = ['', ''];


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.only( top: getProportionateScreenWidth(20)),
      width: Get.size.width,
      height: getProportionateScreenHeight(350),
      decoration: BoxDecoration(
      color: Colors.grey,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(5),
      ),
      child :Column(
        mainAxisAlignment: MainAxisAlignment.start,
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: getProportionateScreenHeight(10)),
          for (var index= 0; index<options.length; index = index+1 ) ...[
            Container(
               // width: getProportionateScreenWidth(450),
                height: getProportionateScreenHeight(50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        width: getProportionateScreenWidth(130),
                        height: getProportionateScreenHeight(50),
                        child: ListTile(
                          title: Text(options[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                          selected: selectedOptions.contains(options[index]),
                          onTap: () {
                            setState(() {
                              if (selectedOptions[0] == '') {
                                selectedOptions[0] = options[index];
                              } else if (selectedOptions[1] == '') {
                                selectedOptions[1] = options[index];
                              } else {
                                selectedOptions[0] = selectedOptions[1];
                                selectedOptions[1] = options[index];
                              }
                            });
                            widget.responses.add(selectedOptions);
                          },
                        )),
                    Row(
                        children:[
                          SizedBox(
                              width: getProportionateScreenWidth(200),
                            child: Text(
                              ( Descriptions[index].length <= 40)
                                  ? Descriptions[index]
                                  : Descriptions[index].substring(0, 40) + '...',
                                style: TextStyle(fontSize: 10)
                            ),
                          ),
                          if ( Descriptions[index].length > 25)
                            TextButton(
                              child: Text('Voir plus',style: TextStyle(color:Color(0xFF0F8A74),fontSize: 10)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(options[index],style:TextStyle(color:Color(0xFF0F8A74))),
                                      content: Text(Descriptions[index]),
                                      actions: [
                                        TextButton(
                                            child: Text("OK", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF0F8A74) , fontSize: 11)),
                                            onPressed: () => Navigator.pop(context))
                                      ],
                                    ));
                              },

                            )
                        ]),
                  ],
                ))
          ],
          SizedBox(height: getProportionateScreenHeight(10)),
          Text('Selected options: ${selectedOptions[0]}, ${selectedOptions[1]}', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 11)),
        ],
      )),
    );
  }
}
