import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';
import 'package:workouts_api/workouts_api.dart';

class StartWorkoutBody extends StatelessWidget {
  const StartWorkoutBody({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    final exercises = workout.exercises;

    return BlocBuilder<StartWorkoutCubit, StartWorkoutState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            left: 8,
                            right: 8,
                          ),
                          child: ExerciseCard(
                            exercise: exercises[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const BottomWorkoutStart(),
          ],
        );
      },
    );
  }
}
