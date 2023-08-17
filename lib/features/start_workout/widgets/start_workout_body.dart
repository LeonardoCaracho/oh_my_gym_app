import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';

/// {@template start_workout_body}
/// Body of the StartWorkoutPage.
///
/// Add what it does
/// {@endtemplate}
class StartWorkoutBody extends StatelessWidget {
  /// {@macro start_workout_body}
  const StartWorkoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartWorkoutCubit, StartWorkoutState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
