import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/core/widgets/primary_button.dart';

import '../../core/constants.dart';
import '../movie_flow/movie_flow_controller.dart';
import '../result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({super.key});

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
              "How many years back should we\n check for?",
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${ref.watch(movieFlowControllerProvider).yearsBack.ceil()}",
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
              value:
                  ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              onChanged: (double value) {
                ref.read(movieFlowControllerProvider.notifier).updateYearsBack(
                      value.toInt(),
                    );
              },
              min: 0,
              max: 70,
              divisions: 70,
              label: "${ref.watch(movieFlowControllerProvider).yearsBack}",
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
