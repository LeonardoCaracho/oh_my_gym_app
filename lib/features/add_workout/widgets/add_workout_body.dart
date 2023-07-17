import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/add_workout/cubit/cubit.dart';

/// {@template add_workout_body}
/// Body of the AddWorkoutPage.
///
/// Add what it does
/// {@endtemplate}
class AddWorkoutBody extends StatelessWidget {
  /// {@macro add_workout_body}
  const AddWorkoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddWorkoutCubit, AddWorkoutState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
