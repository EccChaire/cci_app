

class User {
  double? userId;
  String? username;
  String? userPw;

  User({
    this.userId,
    this.username,
    this.userPw,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ,
      username: json['username'] ,
      userPw: json['userPw'] ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['userPw'] = userPw;
    return data;
  }
}
