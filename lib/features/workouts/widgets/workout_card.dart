import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.lightPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout A',
              style: UITextStyle.headline4,
            ),
            const SizedBox(height: UISpacing.lg),
            Text(
              'Total Exercises: 20',
              style: UITextStyle.bodyText2,
            ),
            Text(
              'Total Sets: 20',
              style: UITextStyle.bodyText2,
            ),
            Expanded(
              child: Center(
                child: IconButton.outlined(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle_fill_outlined,
                    size: 42,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
