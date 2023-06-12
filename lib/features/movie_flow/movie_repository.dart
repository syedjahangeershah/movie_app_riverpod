import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/features/result/movie_entity.dart';

import '../../core/environment_variables.dart';
import '../../main.dart';
import '../genre/genre_entity.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepository {
  Future<List<GenreEntity>> getMovieGenres();

  Future<List<MovieEntity>> getRecommendedMovies(
    double rating,
    String date,
    String genreIds,
  );
}

class TMDBMovieRepository implements MovieRepository {
  TMDBMovieRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<GenreEntity>> getMovieGenres() async {
    final response = await dio.get(
      'genre/movie/list',
      queryParameters: {
        'api_key': api,
        'language': 'en-US',
      },
    );
    final results = List<Map<String, dynamic>>.from(response.data['genres']);
    final genres = results.map((e) => GenreEntity.fromMap(e)).toList();
    return genres;
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
    double rating,
    String date,
    String genreIds,
  ) {
    // TODO: implement getRecommendedMovies
    throw UnimplementedError();
  }
}





