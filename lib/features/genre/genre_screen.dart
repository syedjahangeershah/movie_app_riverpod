import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/core/widgets/primary_button.dart';

import '../../core/constants.dart';
import '../movie_flow/movie_flow_controller.dart';
import 'genre_model.dart';
import 'list_card.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Let's get started with a genre",
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: kListSpacingItem),
                itemCount: ref.watch(movieFlowControllerProvider).genres.length,
                itemBuilder: (ctx, index) {
                  final genre =
                      ref.watch(movieFlowControllerProvider).genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () {
                      ref.read(movieFlowControllerProvider.notifier).toggleSelected(genre);
                    },
                  );
                },
                separatorBuilder: (ctx, index) => const SizedBox(
                  height: kListSpacingItem,
                ),
              ),
            ),
            PrimaryButton(
                onPressed: () {
                  ref.read(movieFlowControllerProvider.notifier).nextPage();
                },
                text: "Continue"),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
