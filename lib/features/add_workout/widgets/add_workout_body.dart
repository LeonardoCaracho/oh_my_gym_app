import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';

class AddWorkoutBody extends StatelessWidget {
  const AddWorkoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const AddWorkoutHeader(),
          const SizedBox(height: 30),
          WorkoutNameInput(),
          const SizedBox(height: 20),
          BlocBuilder<AddWorkoutCubit, AddWorkoutState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.exercises.length + 1,
                  itemBuilder: (_, index) {
                    if (index == state.exercises.length) {
                      return DefaultButton(
                        text: 'Add Exercise',
                        icon: Icons.add,
                        onPressed: () =>
                            context.read<AddWorkoutCubit>().addExercise(),
                      );
                    }

                    return ExerciseCard(
                      exercise: state.exercises[index],
                    );
                  },
                ),
              );
            },
          ),
          BlocListener<AddWorkoutCubit, AddWorkoutState>(
            listener: (context, state) {
              if (state.status.isSuccess) {
                context.pop();
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    text: 'CANCEL',
                    onPressed: () => context.pop(),
                  ),
                ),
                const SizedBox(width: 20),
                BlocBuilder<AddWorkoutCubit, AddWorkoutState>(
                  builder: (context, state) {
                    return Expanded(
                      child: LoadingButton(
                        text: 'SAVE',
                        textOnLoading: 'SAVING',
                        icon: const Icon(Icons.save),
                        isLoading: state.status.isLoading,
                        onPressed: () {
                          context.read<AddWorkoutCubit>().saveWorkout();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
