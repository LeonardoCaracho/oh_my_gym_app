import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';
import 'package:oh_my_gym_app/features/workouts/widgets/workouts_body.dart';

/// {@template workouts_page}
/// A description for WorkoutsPage
/// {@endtemplate}
class WorkoutsPage extends StatelessWidget {
  /// {@macro workouts_page}
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutsBloc(),
      child: const Scaffold(
        body: WorkoutsView(),
      ),
    );
  }
}

/// {@template workouts_view}
/// Displays the Body of WorkoutsView
/// {@endtemplate}
class WorkoutsView extends StatelessWidget {
  /// {@macro workouts_view}
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkoutsBody();
  }
}
