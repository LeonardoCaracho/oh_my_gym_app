import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/app/bloc/app_bloc.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

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
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyWorkoutsHeader(),
              const SizedBox(height: 30),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.1,
                  ),
                  children: const [
                    AddWorkoutCard(),
                    WorkoutCard(),
                    WorkoutCard(),
                  ],
                ),
              ),
              // Expanded(
              //   child: ListView(
              //     children: [
              //       ElevatedButton(
              //         child: const Text('Add Workout!'),
              //         onPressed: () {
              //
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // ElevatedButton(
              //   child: const Text('Logout!'),
              //   onPressed: () => context.read<AppBloc>().add(
              //         const AppLogoutRequested(),
              //       ),
              // ),
              // ElevatedButton(
              //   child: const Text('Add Workout!'),
              //   onPressed: () {
              //     context.goNamed(
              //       RouteConstants.addWorkoutRouteName,
              //     );
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
