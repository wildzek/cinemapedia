import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MovieDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-ESP'
      }));
  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    response.data;
    final List<Movie> movies = [];

    return movies;
  }
}
