import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';

/// {@template edit_workout_body}
/// Body of the EditWorkoutPage.
///
/// Add what it does
/// {@endtemplate}
class EditWorkoutBody extends StatelessWidget {
  /// {@macro edit_workout_body}
  const EditWorkoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWorkoutCubit, EditWorkoutState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
