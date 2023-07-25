import 'package:flutter/material.dart';
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
          Expanded(
            child: BlocBuilder<AddWorkoutCubit, AddWorkoutState>(
              builder: (context, state) {
                return ListView.builder(
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
                      workoutIndex: index,
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: 'Cancel',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: DefaultButton(
                  text: 'Save Workout',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
