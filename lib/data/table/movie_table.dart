import 'package:hive/hive.dart';
import '../../domain/entities/movie_entity.dart';
part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final num voteAverage;

  @HiveField(4)
  final String backdropPath;

  @HiveField(5)
  final String releaseDate;

  @HiveField(6)
  final String overview;

  const MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.backdropPath,
    required this.releaseDate,
    required this.overview,
  }) : super(
    id: id,
    title: title,
    posterPath: posterPath,
    backdropPath: backdropPath,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    overview: overview,
  );

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
      backdropPath: movieEntity.backdropPath,
      releaseDate: movieEntity.releaseDate?? "",
      voteAverage: movieEntity.voteAverage?? 0,
      overview: movieEntity.overview?? "",
    );
  }
}