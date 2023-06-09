import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../genre/genre_model.dart';

@immutable
class MovieModel extends Equatable {
  final String title;
  final String overView;
  final num voteAverage;
  final List<GenreModel> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const MovieModel({
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  MovieModel.initial()
      : title = '',
        overView = '',
        voteAverage = 0,
        genres = [],
        releaseDate = '',
        backdropPath = '',
        posterPath = '';

  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(',');

  @override
  List<Object?> get props => [
        title,
        overView,
        voteAverage,
        genres,
        releaseDate,
        backdropPath,
        posterPath
      ];

  @override
  bool? get stringify => true;
}
