import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';
import 'package:oh_my_gym_app/features/workouts/widgets/workouts_body.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutsBloc(
        workoutsRepository: locator<WorkoutsContract>(),
      )..add(const WorkoutsRequested()),
      child: const Scaffold(
        body: WorkoutsView(),
      ),
    );
  }
}

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: WorkoutsBody(),
    );
  }
}
