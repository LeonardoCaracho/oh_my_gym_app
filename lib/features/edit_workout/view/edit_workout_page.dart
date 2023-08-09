import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/edit_workout/widgets/edit_workout_body.dart';
import 'package:workout_repository/workout_repository.dart';

class EditWorkoutPage extends StatelessWidget {
  const EditWorkoutPage({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditWorkoutCubit(
        EditWorkoutState(workout: workout),
        workoutsRepository: locator<WorkoutsContract>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'OH MY WORKOUT!',
            style: UITextStyle.headline3,
          ),
        ),
        body: const EditWorkoutView(),
      ),
    );
  }
}

class EditWorkoutView extends StatelessWidget {
  const EditWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: EditWorkoutBody(),
    );
  }
}
