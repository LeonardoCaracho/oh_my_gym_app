import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/edit_workout/widgets/edit_workout_body.dart';

/// {@template edit_workout_page}
/// A description for EditWorkoutPage
/// {@endtemplate}
class EditWorkoutPage extends StatelessWidget {
  /// {@macro edit_workout_page}
  const EditWorkoutPage({super.key});

  /// The static route for EditWorkoutPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const EditWorkoutPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditWorkoutCubit(),
      child: const Scaffold(
        body: EditWorkoutView(),
      ),
    );
  }    
}

/// {@template edit_workout_view}
/// Displays the Body of EditWorkoutView
/// {@endtemplate}
class EditWorkoutView extends StatelessWidget {
  /// {@macro edit_workout_view}
  const EditWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditWorkoutBody();
  }
}
