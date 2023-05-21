



class Response {
  String? responseId;
  DateTime? responseDate;
  String? responseDescription;
  String? questionId;
  String? userId;
  String? dowarId;

  Response({
    this.responseId,
    this.responseDate,
    this.responseDescription,
    this.questionId,
    this.userId,
    this.dowarId,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      responseId: json['responseId'] ,
      responseDate: DateTime.parse(json['responseDate'] as String? ?? ''),
      responseDescription: json['responseDescription'] as String?,
      questionId: json['questionId'] ,
      userId: json['userId'] ,
      dowarId: json['dowarId'] ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseId'] = responseId;
    data['responseDate'] = responseDate?.toIso8601String();
    data['responseDescription'] = responseDescription;
    data['questionId'] = questionId;
    data['user'] = userId;
    data['dowar'] = dowarId;
    return data;
  }
}
