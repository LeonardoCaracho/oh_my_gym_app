import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
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
      child: Scaffold(
        body: const WorkoutsView(),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: DefaultButton(
              text: 'WORKOUTS DONE',
              icon: Icons.history,
              onPressed: () =>
                  context.goNamed(RouteConstants.workoutsHistoryRouteName),
            ),
          ),
        ),
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
