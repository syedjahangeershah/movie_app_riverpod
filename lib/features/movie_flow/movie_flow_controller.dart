import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../genre/genre_model.dart';
import 'movie_flow_state.dart';

final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
  (ref) {
    return MovieFlowController(
      MovieFlowState(
        pageController: PageController(),
      ),
    );
  },
);

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state) : super(state);

  void toggleSelected(GenreModel genre) {
    state = state.copyWith(
      genres: [
        for (var oldGenre in state.genres)
          if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
      ],
    );
  }

  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
  }

  void nextPage() {
    if (state.pageController.page! >= 1) {
      if (!state.genres.any((element) => element.isSelected == true)) {
        return;
      }
    }
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}



