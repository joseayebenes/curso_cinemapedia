import 'package:dio/dio.dart';
import 'package:myapp/config/constants/environment.dart';
import 'package:myapp/domain/datasources/movies_datasource.dart';
import 'package:myapp/domain/entities/movies.dart';
import 'package:myapp/infraestructure/mappers/movie_mapper.dart';
import 'package:myapp/infraestructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es_ES',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies =
        movieDbResponse.results
            .where(
              (moviedb) => moviedb.posterPath != 'no-poster',
            ) // Elimina las películas sin poster
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();
    return movies;
  }
}
