import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/edit_workout/widgets/edit_workout_body.dart';
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
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
              actions: [
                if (isEditMode)
                  IconButton(
                    onPressed: () =>
                        context.read<EditWorkoutCubit>().updateWorkout(),
                    icon: const Icon(Icons.update),
                  )
                else
                  BlocBuilder<EditWorkoutCubit, EditWorkoutState>(
                    builder: (context, state) {
                      final hasExercises = state.workout.exercises.isNotEmpty;

                      return IconButton(
                        disabledColor: UIColors.grey,
                        onPressed: hasExercises
                            ? () =>
                                context.read<EditWorkoutCubit>().saveWorkout()
                            : null,
                        icon: const Icon(Icons.check),
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
