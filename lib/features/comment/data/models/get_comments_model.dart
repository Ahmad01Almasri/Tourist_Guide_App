import 'dart:convert';

List<GetCommentsModel> commentModelFromJson(String str) =>
    List<GetCommentsModel>.from(
        json.decode(str).map((x) => GetCommentsModel.fromJson(x)));

String commentModelToJson(List<GetCommentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCommentsModel {
  final String? id;
  final int? placeId;
  final String? userId;
  final String? commentText;
  final DateTime? timestamp;
  final int? v;
  final String? username;

  GetCommentsModel({
    this.id,
    this.placeId,
    this.userId,
    this.commentText,
    this.timestamp,
    this.v,
    this.username,
  });

  GetCommentsModel copyWith({
    String? id,
    int? placeId,
    String? userId,
    String? commentText,
    DateTime? timestamp,
    int? v,
    String? username,
  }) =>
      GetCommentsModel(
        id: id ?? this.id,
        placeId: placeId ?? this.placeId,
        userId: userId ?? this.userId,
        commentText: commentText ?? this.commentText,
        timestamp: timestamp ?? this.timestamp,
        v: v ?? this.v,
        username: username ?? this.username,
      );

  factory GetCommentsModel.fromJson(Map<String, dynamic> json) =>
      GetCommentsModel(
        id: json["_id"],
        placeId: json["placeID"],
        userId: json["userID"],
        commentText: json["commentText"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        v: json["__v"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "placeID": placeId,
        "userID": userId,
        "commentText": commentText,
        "timestamp": timestamp?.toIso8601String(),
        "__v": v,
        "username": username,
      };
}
