import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/start_workout/widgets/start_workout_body.dart';
import 'package:workout_repository/workout_repository.dart';

class StartWorkoutPage extends StatelessWidget {
  const StartWorkoutPage({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    void pop() {
      Navigator.of(context).pop();
    }

    return BlocProvider(
      create: (context) => StartWorkoutCubit(
        historyRepository: locator<HistoryRepository>(),
        workoutsRepository: locator<WorkoutRepository>(),
      )..startWorkout(workout),
      child: PopScope(
        onPopInvoked: (onPopInvoked) async {
          final shouldPop = await confirmationDialog(
            context,
            title: 'EXIT WORKOUT',
            content: 'You will lost all your data, do you really want to leave?',
          );
          if (shouldPop) {
            pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const CommonHeader(title: 'WORKOUT STARTED')),
          body: Builder(
            builder: (context) {
              return BlocBuilder<StartWorkoutCubit, StartWorkoutState>(
                builder: (context, state) {
                  return StartWorkoutView(
                    exercises: state.exercises ?? [],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class StartWorkoutView extends StatelessWidget {
  const StartWorkoutView({
    required this.exercises,
    super.key,
  });

  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StartWorkoutBody(
        exercises: exercises,
      ),
    );
  }
}
