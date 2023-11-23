import 'package:hive/hive.dart';
import '../../domain/entities/movie_entity.dart';
part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity{
  @override
  @HiveField(0)
  final int id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final String posterPath;

  @override
  @HiveField(3)
  final num voteAverage;

  @override
  @HiveField(4)
  final String backdropPath;

  @override
  @HiveField(5)
  final String releaseDate;

  @override
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