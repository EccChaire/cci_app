

class Question {
  double? questionId;
  String? questionType;
  String? questionDescription;

  Question({this.questionId, this.questionType, this.questionDescription});


  // The two functions bellow are colled serializers for the model Question

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['questionId'] ,
      questionType: json['questionType'] ,
      questionDescription: json['questionDescription'] ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionId'] = questionId;
    data['questionType'] = questionType;
    data['questionDescription'] = questionDescription;
    return data;
  }
}
