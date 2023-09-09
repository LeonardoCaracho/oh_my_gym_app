import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:history_repository/history_repository.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/start_workout/widgets/start_workout_body.dart';
import 'package:workouts_api/workouts_api.dart';

class StartWorkoutPage extends StatelessWidget {
  const StartWorkoutPage({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartWorkoutCubit(
        historyRepository: locator<HistoryContract>(),
      )..startWorkout(workout),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'START MY WORKOUT!',
            style: UITextStyle.headline3,
          ),
        ),
        body: StartWorkoutView(
          workout: workout,
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
