import 'package:hive/hive.dart';
import '../../domain/entities/movie_entity.dart';
part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity{
  const MovieTable({
    @HiveField(0)
    required int id,
    @HiveField(1)
    required String title,
    @HiveField(2)
    required String posterPath,
    @HiveField(3)
    required num voteAverage,
    @HiveField(4)
    required String backdropPath,
    @HiveField(5)
    required String releaseDate,
    @HiveField(6)
    required String overview,
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