import 'package:flutter/material.dart';
import 'package:history_repository/history_repository.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/start_workout/widgets/start_workout_body.dart';
import 'package:workout_repository/workout_repository.dart';
import 'package:workouts_api/workouts_api.dart';

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
        historyRepository: locator<HistoryContract>(),
        workoutsRepository: locator<WorkoutsContract>(),
      )..startWorkout(workout),
      child: PopScope(
        onPopInvoked: (onPopInvoked) async {
          final shouldPop = await exitPageDialog(
            context,
            title: 'EXIT WORKOUT',
            content:
                'You will lost all your data, do you really want to leave?',
          );
          if (shouldPop) {
            pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const CommonHeader(title: 'WORKOUT STARTED')),
          body: StartWorkoutView(
            workout: workout,
          ),
        ),
      ),
    );
  }
}

class StartWorkoutView extends StatelessWidget {
  const StartWorkoutView({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StartWorkoutBody(
        workout: workout,
      ),
    );
  }
}
