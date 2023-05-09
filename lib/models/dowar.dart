

class Dowar {
  double? douwarId;
  String? dowarName;
  String? dowarLongInt;
  String? dowarLatInt;

  Dowar({
    this.douwarId,
    this.dowarName,
    this.dowarLongInt,
    this.dowarLatInt,
  });

  factory Dowar.fromJson(Map<String, dynamic> json) {
    return Dowar(
      douwarId: json['douwarId'] ,
      dowarName: json['dowarName'] ,
      dowarLongInt: json['dowarLongInt'] ,
      dowarLatInt: json['dowarLatInt'] ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['douwarId'] = douwarId;
    data['dowarName'] = dowarName;
    data['dowarLongInt'] = dowarLongInt;
    data['dowarLatInt'] = dowarLatInt;
    return data;
  }
}
