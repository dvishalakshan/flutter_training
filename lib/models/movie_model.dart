// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String movieUrl = "https://api.tvmaze.com/search/shows?q=";

  Future<List<MovieModel>> getListMovies(String movieName) async {
    http.Response response = await http.get(Uri.parse("$movieUrl$movieName"));
    log("RESPONSE  :: ${json.decode(response.body)}");
    if (response.body.isNotEmpty) {
      return movieModelFromJson(response.body);
    } else {
      return Future.error("No Movies Found");
    }
  }
}

List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    required this.show,
  });

  Show show;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        show: Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "show": show.toJson(),
      };
}

class Show {
  Show({
    required this.id,
    required this.name,
    this.type,
    this.language,
    this.genres,
    this.rating,
    this.image,
    this.summary,
  });

  int id;
  String name;
  String? type;
  String? language;
  List<String>? genres;
  Rating? rating;
  Image? image;
  String? summary;

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        rating: Rating.fromJson(json["rating"]),
        image: Image.fromJson(json["image"]),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres?.map((x) => x) ?? []),
        "rating": rating?.toJson(),
        "image": image?.toJson(),
        "summary": summary,
      };
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Rating {
  Rating({
    this.average,
  });

  double? average;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}
