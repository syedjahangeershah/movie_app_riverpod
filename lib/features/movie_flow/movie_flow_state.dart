import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../genre/genre_model.dart';
import '../result/movie_model.dart';

const movieMock = MovieModel(
  title: "The hulk",
  overview:
      "Bruce Banner, a genetic research with a tragic past, suffer an accident that causes him etc.",
  voteAverage: 4.0,
  genres: [GenreModel(name: "Action"), GenreModel(name: "Fantasy")],
  releaseDate: "2019-05-04",
  backdropPath: "",
  posterPath: "",
);

const genresMock = [
  GenreModel(name: "Action"),
  GenreModel(name: "Comedy"),
  GenreModel(name: "Horror"),
  GenreModel(name: "Anime"),
  GenreModel(name: "Drama"),
  GenreModel(name: "Family"),
  GenreModel(name: "Romance"),
];

@immutable
class MovieFlowState extends Equatable {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<GenreModel> genres;
  final MovieModel movie;

  const MovieFlowState({
    required this.pageController,
    this.rating = 5,
    this.yearsBack = 10,
    this.genres = genresMock,
    this.movie = movieMock,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<GenreModel>? genres,
    MovieModel? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object?> get props => [pageController, rating, yearsBack, genres, movie];
}
