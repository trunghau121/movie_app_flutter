import '../../domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  final bool adult;
  final BelongsToCollection? belongsToCollection;
  final int budget;
  final List<Genres>? genres;
  final String homepage;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final bool video;
  final int voteCount;

  const MovieDetailModel(
      {required this.adult,
      required String? backdropPath,
      required this.belongsToCollection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required int id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required String overview,
      required this.popularity,
      required String posterPath,
      required String releaseDate,
      required this.revenue,
      required this.runtime,
      required this.status,
      required this.tagline,
      required String title,
      required this.video,
      required num voteAverage,
      required this.voteCount})
      : super(
          id: id,
          title: title,
          releaseDate: releaseDate,
          duration: runtime,
          overview: overview,
          voteAverage: voteAverage,
          backdropPath: backdropPath??"",
          posterPath: posterPath,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? BelongsToCollection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: _genres(json),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      data['belongs_to_collection'] = belongsToCollection!.toJson();
    }
    data['budget'] = budget;
    data['genres'] = genres?.map((v) => v.toJson()).toList();
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

_genres(Map<String, dynamic> json) {
  if (json['genres'] != null) {
    final List<Genres> genres = [];
    json['genres'].forEach((v) {
      genres.add(Genres.fromJson(v));
    });
  }
}

class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongsToCollection(
      {required this.id,
      required this.name,
      required this.posterPath,
      required this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
