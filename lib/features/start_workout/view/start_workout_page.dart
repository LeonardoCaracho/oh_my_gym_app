import 'package:flutter/material.dart';
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
    return BlocProvider(
      create: (context) => StartWorkoutCubit(),
      child: Scaffold(
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
