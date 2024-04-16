import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';
import 'package:oh_my_gym_app/features/workouts/widgets/workouts_body.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<WorkoutsBloc>()
        ..add(
          const WorkoutsRequested(),
        ),
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
