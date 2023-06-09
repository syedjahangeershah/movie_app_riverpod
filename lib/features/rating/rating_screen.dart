import 'package:flutter/material.dart';
import 'package:new_app/core/constants.dart';

import '../../core/widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  const RatingScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5;

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
              "Select a minimum rating\nranging from 1-10",
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${rating.ceil()}", style: theme.textTheme.displayMedium),
                const Icon(Icons.star_rounded, color: Colors.amber, size: 62),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
              value: rating,
              min: 1,
              max: 10,
              divisions: 10,
              label: "${rating.ceil()}",
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: widget.nextPage,
              text: "Yes please",
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
