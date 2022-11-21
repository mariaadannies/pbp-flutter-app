// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
    MyWatchList({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
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
    });

    Watched? watched;
    Title? title;
    int rating;
    ReleaseDate? releaseDate;
    Review? review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: watchedValues.map[json["watched"]],
        title: titleValues.map[json["title"]],
        rating: json["rating"],
        releaseDate: releaseDateValues.map[json["release_date"]],
        review: reviewValues.map[json["review"]],
    );

    Map<String, dynamic> toJson() => {
        "watched": watchedValues.reverse[watched],
        "title": titleValues.reverse[title],
        "rating": rating,
        "release_date": releaseDateValues.reverse[releaseDate],
        "review": reviewValues.reverse[review],
    };
}

enum ReleaseDate { THE_03032003 }

final releaseDateValues = EnumValues({
    "03/03/2003": ReleaseDate.THE_03032003
});

enum Review { MANTAPS }

final reviewValues = EnumValues({
    "Mantaps": Review.MANTAPS
});

enum Title { UP }

final titleValues = EnumValues({
    "Up": Title.UP
});

enum Watched { YA, TIDAK }

final watchedValues = EnumValues({
    "Tidak": Watched.TIDAK,
    "Ya": Watched.YA
});

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues = EnumValues({
    "mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST
});

class EnumValues<T> {
    late Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
