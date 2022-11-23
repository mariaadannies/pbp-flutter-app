// To parse this JSON data, do
//
//    final myWatchlist = myWatchlistFromJson(jsonString);

import 'dart:convert';

List<MyWatchlist> myWatchlistFromJson(String str) => List<MyWatchlist>.from(
    json.decode(str).map((x) => MyWatchlist.fromJson(x)));

String myWatchlistToJson(List<MyWatchlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchlist {
  MyWatchlist({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory MyWatchlist.fromJson(Map<String, dynamic> json) => MyWatchlist(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse![model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
    required this.isWatched,
  });

  String watched;
  String title;
  int rating;
  String releaseDate;
  String review;
  bool isWatched;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: json["watched"],
        title: json["title"],
        rating: json["rating"],
        releaseDate: json["release_date"],
        review: json["review"],
        isWatched: json["watched"] == "Ya" ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
      };
}

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues =
    EnumValues({"mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
