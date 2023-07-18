import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.lightPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const SizedBox(
        width: double.infinity,
        height: 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Leg press 45'),
                Text('Obs: heavy load'),
              ],
            ),
            ExerciseSetRow(),
          ],
        ),
      ),
    );
  }
}

class ExerciseSetRow extends StatelessWidget {
  const ExerciseSetRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
