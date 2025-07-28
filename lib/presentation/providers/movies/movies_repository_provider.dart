import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/infraestructure/datasources/moviedb_datasource.dart';
import 'package:myapp/infraestructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
