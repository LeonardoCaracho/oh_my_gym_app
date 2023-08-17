import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/start_workout/widgets/start_workout_body.dart';

/// {@template start_workout_page}
/// A description for StartWorkoutPage
/// {@endtemplate}
class StartWorkoutPage extends StatelessWidget {
  /// {@macro start_workout_page}
  const StartWorkoutPage({super.key});

  /// The static route for StartWorkoutPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const StartWorkoutPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartWorkoutCubit(),
      child: const Scaffold(
        body: StartWorkoutView(),
      ),
    );
  }    
}

/// {@template start_workout_view}
/// Displays the Body of StartWorkoutView
/// {@endtemplate}
class StartWorkoutView extends StatelessWidget {
  /// {@macro start_workout_view}
  const StartWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const StartWorkoutBody();
  }
}
