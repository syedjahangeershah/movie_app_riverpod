import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback previousPage, nextPage;

  const LandingScreen({
    Key? key,
    required this.previousPage,
    required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Let's find a movie",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset("images/movie.png"),
            const Spacer(),
            PrimaryButton(
              onPressed: nextPage,
              text: "Get Started",
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
