import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPLaying;
  return MoviesNotifier(
    fecthMoreMovies: fetchMoreMovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fecthMoreMovies;

  MoviesNotifier({required this.fecthMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fecthMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
