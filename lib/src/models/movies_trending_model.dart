//definiendo las clases para poder acceder a los atributos de las peliculas

import 'dart:convert';

Trending trendingFromJson(String str) => Trending.fromJson(json.decode(str));

String trendingToJson(Trending data) => json.encode(data.toJson());

class Trending {
  Trending({
    this.watchers,
    this.movie,
  });

  int watchers;
  Movie movie;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        watchers: json["watchers"] == null ? null : json["watchers"],
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
      );

  Map<String, dynamic> toJson() => {
        "watchers": watchers == null ? null : watchers,
        "movie": movie == null ? null : movie.toJson(),
      };
}

class Movie {
  Movie({
    this.title,
    this.year,
    this.ids,
  });

  String title;
  int year;
  Ids ids;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "ids": ids == null ? null : ids.toJson(),
      };
}

class Ids {
  Ids({
    this.trakt,
    this.slug,
    this.imdb,
    this.tmdb,
  });

  int trakt;
  String slug;
  String imdb;
  int tmdb;

  factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        trakt: json["trakt"] == null ? null : json["trakt"],
        slug: json["slug"] == null ? null : json["slug"],
        imdb: json["imdb"] == null ? null : json["imdb"],
        tmdb: json["tmdb"] == null ? null : json["tmdb"],
      );

  Map<String, dynamic> toJson() => {
        "trakt": trakt == null ? null : trakt,
        "slug": slug == null ? null : slug,
        "imdb": imdb == null ? null : imdb,
        "tmdb": tmdb == null ? null : tmdb,
      };
}
