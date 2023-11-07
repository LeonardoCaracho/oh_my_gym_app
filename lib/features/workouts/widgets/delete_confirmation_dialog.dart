import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workouts_api/workouts_api.dart';

Future<void> deleteConfirmationDialog(
  BuildContext context,
  Workout workout,
) async {
  final workoutsBloc = context.read<WorkoutsBloc>();

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: workoutsBloc,
        child: Builder(
          builder: (context) {
            return AlertDialog(
              backgroundColor: UIColors.liver,
              title: Text(
                workout.name,
                textAlign: TextAlign.center,
                style: UITextStyle.headline4.copyWith(
                  color: UIColors.white,
                ),
              ),
              content: const Text(
                'DO YOU REALLY WANT TO DELETE THIS WORKOUT?',
                textAlign: TextAlign.center,
              ),
              actions: [
                DefaultButton(
                  text: 'YES',
                  onPressed: () {
                    context.read<WorkoutsBloc>().add(
                          WorkoutRemoved(
                            workout: workout,
                          ),
                        );
                    Navigator.of(context).pop();
                  },
                ),
                DefaultButton(
                  text: 'NO',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
