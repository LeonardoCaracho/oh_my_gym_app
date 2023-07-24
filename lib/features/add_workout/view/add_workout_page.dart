import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/add_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/add_workout/widgets/add_workout_body.dart';

class AddWorkoutPage extends StatelessWidget {
  const AddWorkoutPage({super.key});

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

class AddWorkoutView extends StatelessWidget {
  const AddWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: AddWorkoutBody(),
    );
  }
}
