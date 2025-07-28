import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/domain/entities/movies.dart';
import 'package:myapp/presentation/providers/movies/movies_providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlatingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlatingMovies.isEmpty) {
    return const [];
  } else {
    return nowPlatingMovies.sublist(0, 6);
  }
});
