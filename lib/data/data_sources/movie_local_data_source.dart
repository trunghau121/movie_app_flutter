import 'package:hive/hive.dart';
import '../../domain/entities/movie_entity.dart';
import '../table/movie_table.dart';

abstract class MovieLocalDataSource{
  Future<void> saveMovie(MovieTable movieEntity);
  Future<List<MovieTable>> getFavoriteMovies();
  Future<void> deleteFavoriteMovie(int movieId);
  Future<bool> checkIfMovieFavorite(int movieId);
}

class MovieLocalDataSourceImp extends MovieLocalDataSource{
  @override
  Future<bool> checkIfMovieFavorite(int movieId) async{
    var localBox = await Hive.openBox("movieBox");
    return localBox.containsKey(movieId);
  }

  @override
  Future<void> deleteFavoriteMovie(int movieId) async{
    var localBox = await Hive.openBox("movieBox");
    localBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getFavoriteMovies() async{
    var localBox = await Hive.openBox("movieBox");
    List<MovieTable> data = [];
    for (var movieId in localBox.keys) {
      var item = localBox.get(movieId);
      data.add(item);
    }
    return data;
  }

  @override
  Future<void> saveMovie(MovieEntity movieEntity) async{
    var localBox = await Hive.openBox("movieBox");
    await localBox.put(movieEntity.id, movieEntity);
  }

}