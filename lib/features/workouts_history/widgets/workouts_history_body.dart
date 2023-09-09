import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';

/// {@template workouts_history_body}
/// Body of the WorkoutsHistoryPage.
///
/// Add what it does
/// {@endtemplate}
class WorkoutsHistoryBody extends StatelessWidget {
  /// {@macro workouts_history_body}
  const WorkoutsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsHistoryCubit, WorkoutsHistoryState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
