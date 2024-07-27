// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

import '../../../historical/data/models/location_sub_historical_model.dart';

List<RestaurantModel> hotelModelFromJson(String str) =>
    List<RestaurantModel>.from(
        json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String hotelModelToJson(List<RestaurantModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
  final Location? location;
  final String? id;
  final int? placeId;
  final String? placeName;
  final String? description;
  final List<String>? images;
  final double? averageRating;
  final int? numberOfRatings;
  final int? type;
  final int? provinceId;
  final int? v;

  RestaurantModel({
    this.location,
    this.id,
    this.placeId,
    this.placeName,
    this.description,
    this.images,
    this.averageRating,
    this.numberOfRatings,
    this.type,
    this.provinceId,
    this.v,
  });

  RestaurantModel copyWith({
    Location? location,
    String? id,
    int? placeId,
    String? placeName,
    String? description,
    List<String>? images,
    double? averageRating,
    int? numberOfRatings,
    int? type,
    int? provinceId,
    int? v,
  }) =>
      RestaurantModel(
        location: location ?? this.location,
        id: id ?? this.id,
        placeId: placeId ?? this.placeId,
        placeName: placeName ?? this.placeName,
        description: description ?? this.description,
        images: images ?? this.images,
        averageRating: averageRating ?? this.averageRating,
        numberOfRatings: numberOfRatings ?? this.numberOfRatings,
        type: type ?? this.type,
        provinceId: provinceId ?? this.provinceId,
        v: v ?? this.v,
      );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
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
        type: json["type"],
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
        "type": type,
        "provinceID": provinceId,
        "__v": v,
      };
}
