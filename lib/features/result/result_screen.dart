import 'package:flutter/material.dart';

import '../genre/genre_model.dart';
import 'movie_model.dart';

class ResultScreen extends StatelessWidget {
  static route({bool fullScreenDialog = true}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
        fullscreenDialog: fullScreenDialog,
      );

  const ResultScreen({Key? key}) : super(key: key);

  final double movieHeight = 150;

  final fakeMovie = const MovieModel(
    title: "The hulk",
    overView: "Bruce Banner, a genetic research with a tragic past, suffer an accident that causes him etc.",
    voteAverage: 4.0,
    genres: [GenreModel(name: "Action"), GenreModel(name: "Fantasy")],
    releaseDate: "2019-05-04",
    backdropPath: "",
    posterPath: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CoverImage(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}
