import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/workouts_history/widgets/workouts_history_body.dart';

class WorkoutsHistoryPage extends StatelessWidget {
  const WorkoutsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<WorkoutsHistoryCubit>()..getRecords(),
      child: Scaffold(
        appBar: AppBar(
          title: const CommonHeader(
            title: 'OH MY HISTORY',
          ),
        ),
        body: const WorkoutsHistoryView(),
      ),
    );
  }
}

class WorkoutsHistoryView extends StatelessWidget {
  const WorkoutsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkoutsHistoryBody();
  }
}
