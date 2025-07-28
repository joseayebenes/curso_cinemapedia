import 'package:myapp/domain/datasources/movies_datasource.dart';
import 'package:myapp/domain/entities/movies.dart';
import 'package:myapp/domain/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
