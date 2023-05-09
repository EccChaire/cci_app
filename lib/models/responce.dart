

import 'package:cci_app/models/dowar.dart';
import 'package:cci_app/models/user.dart';

class Response {
  double? responseId;
  DateTime? responseDate;
  String? responseDescription;
  User? user;
  Dowar? dowar;

  Response({
    this.responseId,
    this.responseDate,
    this.responseDescription,
    this.user,
    this.dowar,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      responseId: json['responseId'] as double?,
      responseDate: DateTime.parse(json['responseDate'] as String? ?? ''),
      responseDescription: json['responseDescription'] as String?,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      dowar: json['dowar'] != null ? Dowar.fromJson(json['dowar']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseId'] = responseId;
    data['responseDate'] = responseDate?.toIso8601String();
    data['responseDescription'] = responseDescription;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (dowar != null) {
      data['dowar'] = dowar!.toJson();
    }
    return data;
  }
}
