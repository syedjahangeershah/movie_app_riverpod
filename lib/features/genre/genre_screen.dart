import 'package:flutter/material.dart';
import 'package:new_app/core/widgets/primary_button.dart';

import '../../core/constants.dart';
import 'genre_model.dart';
import 'list_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<GenreModel> genres = const [
    GenreModel(name: "Action"),
    GenreModel(name: "Comedy"),
    GenreModel(name: "Horror"),
    GenreModel(name: "Anime"),
    GenreModel(name: "Drama"),
    GenreModel(name: "Family"),
    GenreModel(name: "Romance"),
  ];

  void toggleSelected(GenreModel genre) {
    List<GenreModel> updatedGenre = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() {
      genres = updatedGenre;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
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
                itemBuilder: (ctx, index) {
                  final genre = genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => toggleSelected(genre),
                  );
                },
                separatorBuilder: (ctx, index) => const SizedBox(
                  height: kListSpacingItem,
                ),
                itemCount: genres.length,
              ),
            ),
            PrimaryButton(onPressed: widget.nextPage, text: "Continue"),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
