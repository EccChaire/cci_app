import 'package:flutter/material.dart';



class ChooseTwoInOrderQuestion extends StatefulWidget {
  final String question;

  ChooseTwoInOrderQuestion({required this.question});

  @override
  _ChooseTwoInOrderQuestionState createState() => _ChooseTwoInOrderQuestionState();
}

class _ChooseTwoInOrderQuestionState extends State<ChooseTwoInOrderQuestion> {
  List<String> options = [    'Pré-Émergence',    'Émergence',    'Equilibre',    'Déclin', 'Effondrement', ];
  List<String> Descriptions = [ "La communauté se trouve dans un environnement géographiquement isolé des centres activité et de decisions. Dans certains cas, elle a choisi de s'isoler des flux de passage autour d'un centre urbain ou semi-urbain proche dans un souci de préservation identitaire ou de son cadre de vie ou de ses pratiques culturelles. Dans les zones isolées par la géographie, il existe des possiblités, et parfois même des projets de désenclavement (routes, transports en commun, .). Dans les communautés isolées, par choix ou par la géographie, des ressources locales exploitables pour s'autonomiser existent et la population maitrise les compétences de base permettant d'en tier profit. Le village dispose des infrastructures de base nécessaires a existence et au développement de futurs projets.",
    "Sous l'impulsion des leaders et avec l'aide de partenaires extérieurs, les infrastructures manquantes (routes, scolaire, santé, réseau, ..) sont peu à peu mises en place soit par les services de Etat soit par la communauté elle-même. Plusieurs projets d'autonomisation fonds sur l'exploitation des ressources naturelles locales afin de répondre aux besoins de la population sont mis en oeuvre et permettent de développer ou de relocaliser des activités vivrières ou génératrices de revenus au sein de la communauté. Les projets de. valorisation des richesses naturelles prennent parfois en compte le renouvellement et 1a durabilité des ressources consommes.",
    "Les voies d'accès existent et permettent quotidiennement l'accès facile de la communauté à l'ensemble des Services publics et privés dont ses membres pourraient avoir besoin (éducation, santé, emplois distants, marchés d'approvisionnement...). Les moyens de transport sont disponibles en nombre suffisant et la fréquence des rotations répond aux besoins courants ou urgents. Peu infrastructures nouvelles sont mises en place (tous les besoins sont couverts) mais celles qui existent sont maintenues, financées, de bonne qualité et restent en bon état de fonctionnement. Un marché local s'est développé qui donne accès à tout un chacun aux biens et aux services produits à l'intérieur de 1a communauté.",
    "l'exploitation non maitrisée des ressources locales s'est traduite par a raréfaction de ces ressources et des confits de propriété ou d'usage ont parfois même éclaté. Les infrastructures qui avaient Été mises en place sont obsolètes, insuffisantes pour couvrir les (nouveaux) besoins. Elles ont parfois même été abandonnées faute de maintenance, de travail collectif pour les entretenir, de formation pour les exploiter, ou de financement. Dans certains cas, usage de ces infrastructures donne lieu a des conflits et la communauté préfère s'en désengager.",
    "La communauté se trouve dans un environnement géographiquement isolé des centres activité et de decision. Cet isolement est perçu comme une barrière au développement. Ces communautés isolées. connaissent mal ou pas du tout les ressources locales exploitables pour s'autonomiser et la population ne maitrise plus les compétences de base permettant d'en tirer profit. Les infrastructures de base: sont tres réduites et ne peuvent pas servir d'appui à de futurs projets de développement.",];
  List<String> selectedOptions = ['', ''];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30,right:30, top: 20),
    width: 400,
    height: 400,
    decoration: BoxDecoration(
    color: Colors.grey,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(5),
    ),
    child :Column(
      children: [
        Text(widget.question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(options[index]),

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
              },
            );
          },
        ),
        SizedBox(height: 10),
        Text('Selected options: ${selectedOptions[0]}, ${selectedOptions[1]}'),
      ],
    ));
  }
}
