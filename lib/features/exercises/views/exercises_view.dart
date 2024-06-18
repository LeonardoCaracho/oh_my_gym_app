import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/exercises/exercises.dart';
import 'package:workout_repository/workout_repository.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseTypeBloc>(
      create: (context) => ExerciseTypeBloc(locator<ExercisesRepository>())
        ..add(
          ExerciseTypeStarted(),
        ),
      child: const Scaffold(
        body: ExercisesView(),
      ),
    );
  }
}

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ExercisesBody(),
    );
  }
}
