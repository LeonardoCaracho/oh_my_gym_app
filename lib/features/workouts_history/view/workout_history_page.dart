import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';

class WorkoutHistoryPage extends StatelessWidget {
  const WorkoutHistoryPage({
    required this.workoutId,
    super.key,
  });

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<WorkoutsHistoryCubit>()
        ..getRecordsByWorkout(
          workoutId,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'OH MY HISTORY - ITEM',
            style: UITextStyle.headline3,
          ),
        ),
        body: const WorkoutHistoryView(),
      ),
    );
  }
}

class WorkoutHistoryView extends StatelessWidget {
  const WorkoutHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkoutHistoryBody();
  }
}
