import 'dart:convert';

import 'location_sub_model.dart';

List<HistoricalModel> historicalModelFromJson(String str) =>
    List<HistoricalModel>.from(
        json.decode(str).map((x) => HistoricalModel.fromJson(x)));

String historicalModelToJson(List<HistoricalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoricalModel {
  final Location? location;
  final String? id;
  final int? placeId;
  final String? placeName;
  final String? description;
  final List<String>? images;
  final double? averageRating;
  final int? numberOfRatings;
  final int? provinceId;
  final int? v;

  HistoricalModel({
    this.location,
    this.id,
    this.placeId,
    this.placeName,
    this.description,
    this.images,
    this.averageRating,
    this.numberOfRatings,
    this.provinceId,
    this.v,
  });

  HistoricalModel copyWith({
    Location? location,
    String? id,
    int? placeId,
    String? placeName,
    String? description,
    List<String>? images,
    double? averageRating,
    int? numberOfRatings,
    int? provinceId,
    int? v,
  }) =>
      HistoricalModel(
        location: location ?? this.location,
        id: id ?? this.id,
        placeId: placeId ?? this.placeId,
        placeName: placeName ?? this.placeName,
        description: description ?? this.description,
        images: images ?? this.images,
        averageRating: averageRating ?? this.averageRating,
        numberOfRatings: numberOfRatings ?? this.numberOfRatings,
        provinceId: provinceId ?? this.provinceId,
        v: v ?? this.v,
      );

  factory HistoricalModel.fromJson(Map<String, dynamic> json) =>
      HistoricalModel(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        id: json["_id"],
        placeId: json["placeID"],
        placeName: json["placeName"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        averageRating: json["averageRating"]?.toDouble(),
        numberOfRatings: json["numberOfRatings"],
        provinceId: json["provinceID"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "placeID": placeId,
        "placeName": placeName,
        "description": description,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "averageRating": averageRating,
        "numberOfRatings": numberOfRatings,
        "provinceID": provinceId,
        "__v": v,
      };
}
