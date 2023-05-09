import 'package:cci_app/models/dowar.dart';
import 'package:cci_app/models/user.dart';

import 'dart:convert';

class Media {
  String? mediaType;
  String? mediaUrl;
  String? mediaDescription;
  User? uploader;
  Dowar? mediaDowar;

  Media(
      {this.mediaType,
      this.mediaUrl,
      this.mediaDescription,
      this.uploader,
      this.mediaDowar});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      mediaType: json['mediaType'],
      mediaUrl: json['mediaUrl'],
      mediaDescription: json['mediaDescription'],
      uploader:
          json['uploader'] != null ? User.fromJson(json['uploader']) : null,
      mediaDowar: json['mediaDowar'] != null
          ? Dowar.fromJson(json['mediaDowar'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mediaType'] = mediaType;
    data['mediaUrl'] = mediaUrl;
    data['mediaDescription'] = mediaDescription;
    if (uploader != null) {
      data['uploader'] = uploader!.toJson();
    }
    if (mediaDowar != null) {
      data['mediaDowar'] = mediaDowar!.toJson();
    }
    return data;
  }
}
