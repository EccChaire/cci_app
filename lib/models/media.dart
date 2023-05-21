

class Media {
  String? mediaId;
  String? mediaType;
  String? mediaUrl;
  String? mediaDescription;
  String? uploaderId;
  String? dowarId;


  Media({
    this.mediaId,
    this.mediaType,
    this.mediaUrl,
    this.mediaDescription,
    this.uploaderId,
    this.dowarId,
  });

  // Convert Media object to JSON
  Map<String, dynamic> toJson() {
    return {
      'mediaId' : mediaId,
      'mediaType': mediaType,
      'mediaUrl': mediaUrl,
      'mediaDescription': mediaDescription,
      'uploaderId': uploaderId,
      'dowarId': dowarId,
    };
  }

  // Create Media object from JSON
  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      mediaId: json['mediaId'],
      mediaType: json['mediaType'],
      mediaUrl: json['mediaUrl'],
      mediaDescription: json['mediaDescription'],
      uploaderId: json['uploaderId'],
      dowarId: json['dowarId'],
    );
  }
}

