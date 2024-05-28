import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/exercises/exercises.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ExercisesBody()),
    );
  }
}
