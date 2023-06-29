class Infrastructure {
  String infrastructureId;
  String infrastructure;
  String Disponible;
  String qualite_percue;
  String distance;
  String Suffisant;
  String etat;
  String encours;
  String dowarId;
  String userId;
  String commentaire;

  Infrastructure({
    required this.infrastructureId,
    required this.infrastructure,
    required this.Disponible,
    required this.qualite_percue,
    required this.Suffisant,
    required this.etat,
    required this.dowarId,
    required this.userId,
    required this.distance,
    required this.encours,
    required this.commentaire
  });

  factory Infrastructure.fromJson(Map<String, dynamic> json) {
    return Infrastructure(
      infrastructureId: json['infrastructureId'] ,
      infrastructure: json['infrastructure'] ,
      Disponible: json['Disponible'] ,
      qualite_percue: json['Qualité perçue'] ,
      distance : json['Distance'],
      dowarId: json['dowarId'] ,
      Suffisant: json['Suffisant aux besoins'] ,
      etat: json['etat'] ,
      userId: json['userId'] ,
      encours: json['Projets en cours ou planifiés'],
      commentaire: json['commentaire'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['infrastructureId'] = infrastructureId;
    data['infrastructure'] = infrastructure;
    data['Disponible'] = Disponible;
    data['Qualité perçue'] = qualite_percue;
    data['dowar'] = dowarId;
    data['Suffisant aux besoins'] = Suffisant;
    data['etat'] = etat;
    data['Distance']= distance;
    data['userId'] = userId;
    data['Projets en cours ou planifiés'] = encours;
    data['commentaire']= commentaire;
    return data;
  }
}
