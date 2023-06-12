import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../genre/genre_model.dart';
import 'movie_entity.dart';

@immutable
class MovieModel extends Equatable {
  final String title;
  final String overview;
  final num voteAverage;
  final List<GenreModel> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const MovieModel({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  MovieModel.initial()
      : title = '',
        overview = '',
        voteAverage = 0,
        genres = [],
        releaseDate = '',
        backdropPath = '',
        posterPath = '';

  factory MovieModel.fromEntity(
      MovieEntity movieEntity, List<GenreModel> genres) {
    return MovieModel(
      title: movieEntity.title,
      overview: movieEntity.overview,
      voteAverage: movieEntity.voteAverage,
      genres: genres
          .where((genre) => movieEntity.genreIds.contains(genre.id))
          .toList(growable: false),
      releaseDate: movieEntity.releaseDate,
      backdropPath: 'https://image.tmdb.org/t/p/original${movieEntity.backdropPath}',
      posterPath: 'https://image.tmdb.org/t/p/original${movieEntity.posterPath}',
    );
  }

  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(',');

  @override
  List<Object?> get props => [
        title,
        overview,
        voteAverage,
        genres,
        releaseDate,
        backdropPath,
        posterPath
      ];

  @override
  bool? get stringify => true;
}
