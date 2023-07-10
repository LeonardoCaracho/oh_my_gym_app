import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/login/login.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';

/// {@template workouts_body}
/// Body of the WorkoutsPage.
///
/// Add what it does
/// {@endtemplate}
class WorkoutsBody extends StatelessWidget {
  /// {@macro workouts_body}
  const WorkoutsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            child: const Text('Logout!'),
            onPressed: () => context.read<LoginCubit>().signOut(),
          ),
        );
      },
    );
  }
}
