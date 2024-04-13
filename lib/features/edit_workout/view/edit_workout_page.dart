import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:workout_repository/workout_repository.dart';
import 'package:workouts_api/workouts_api.dart';

class EditWorkoutPage extends StatelessWidget {
  const EditWorkoutPage({
    required this.workout,
    this.isEditMode = false,
    super.key,
  });

  final Workout workout;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    void pop() {
      Navigator.of(context).pop();
    }

    return BlocProvider(
      create: (context) => EditWorkoutCubit(
        EditWorkoutState(
          workout: workout,
          isEditMode: isEditMode,
        ),
        workoutsRepository: locator<WorkoutsContract>(),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const CommonHeader(
                title: 'OH MY WORKOUT',
              ),
              leading: IconButton(
                onPressed: () async {
                  if (workout ==
                      context.read<EditWorkoutCubit>().state.workout) {
                    Navigator.of(context).pop();
                  } else {
                    final shouldPop = await exitPageDialog(
                      context,
                      title: 'REVERT CHANGES',
                      content: 'You will lost all the changes',
                    );
                    if (shouldPop) {
                      pop();
                    }
                  }
                },
                icon: const Icon(Icons.close),
              ),
              actions: [
                if (isEditMode)
                  TextButton(
                    onPressed: () =>
                        context.read<EditWorkoutCubit>().updateWorkout(),
                    child: Text(
                      'UPDATE',
                    ),
                  )
                else
                  BlocBuilder<EditWorkoutCubit, EditWorkoutState>(
                    builder: (context, state) {
                      final hasExercises = state.workout.exercises.isNotEmpty;

                      return TextButton(
                        onPressed: hasExercises
                            ? () =>
                                context.read<EditWorkoutCubit>().saveWorkout()
                            : null,
                        child: Text(
                          'SAVE',
                        ),
                      );
                    },
                  ),
              ],
            ),
            body: BlocListener<EditWorkoutCubit, EditWorkoutState>(
              listener: (context, state) {
                if (state.status.isSuccess) {
                  Navigator.of(context).pop(true);
                }
              },
              child: const EditWorkoutView(),
            ),
          );
        },
      ),
    );
  }
}

class EditWorkoutView extends StatelessWidget {
  const EditWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: EditWorkoutBody(),
    );
  }
}
