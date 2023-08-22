import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';

class BottomSectionSaveWorkout extends StatelessWidget {
  const BottomSectionSaveWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButton(
            text: 'CANCEL',
            onPressed: () => context.pop(),
          ),
        ),
        const SizedBox(width: 20),
        BlocConsumer<EditWorkoutCubit, EditWorkoutState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.pop(true);
            }
          },
          builder: (context, state) {
            return Expanded(
              child: LoadingButton(
                text: 'SAVE',
                textOnLoading: 'SAVING',
                icon: const Icon(Icons.save),
                isLoading: state.status.isLoading,
                onPressed: () => context.read<EditWorkoutCubit>().saveWorkout(),
              ),
            );
          },
        ),
      ],
    );
  }
}