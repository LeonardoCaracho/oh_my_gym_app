import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/add_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/add_workout/widgets/add_workout_body.dart';

/// {@template add_workout_page}
/// A description for AddWorkoutPage
/// {@endtemplate}
class AddWorkoutPage extends StatelessWidget {
  /// {@macro add_workout_page}
  const AddWorkoutPage({super.key});

  /// The static route for AddWorkoutPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddWorkoutPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddWorkoutCubit(),
      child: const Scaffold(
        body: AddWorkoutView(),
      ),
    );
  }
}

/// {@template add_workout_view}
/// Displays the Body of AddWorkoutView
/// {@endtemplate}
class AddWorkoutView extends StatelessWidget {
  /// {@macro add_workout_view}
  const AddWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: AddWorkoutBody(),
    );
  }
}
