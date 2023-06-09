import 'package:flutter/material.dart';
import 'package:new_app/core/widgets/primary_button.dart';

import '../../core/constants.dart';
import '../result/result_screen.dart';

class YearsBackScreen extends StatefulWidget {
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  const YearsBackScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  @override
  State<YearsBackScreen> createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;

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
              "How many years back should we\n check for?",
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${yearsBack.ceil()}",
                  style: theme.textTheme.headlineLarge,
                ),
                Text(
                  "Years back",
                  style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.textTheme.headlineMedium?.color
                          ?.withOpacity(.62)),
                )
              ],
            ),
            const Spacer(),
            Slider(
              value: yearsBack,
              onChanged: (double value) {
                setState(() {
                  yearsBack = value;
                });
              },
              min: 0,
              max: 70,
              divisions: 70,
              label: "${yearsBack.ceil()}",
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () => Navigator.of(context).push(ResultScreen.route()),
              text: "Amazing",
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
