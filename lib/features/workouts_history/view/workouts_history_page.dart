import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/workouts_history/widgets/workouts_history_body.dart';

/// {@template workouts_history_page}
/// A description for WorkoutsHistoryPage
/// {@endtemplate}
class WorkoutsHistoryPage extends StatelessWidget {
  /// {@macro workouts_history_page}
  const WorkoutsHistoryPage({super.key});

  /// The static route for WorkoutsHistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const WorkoutsHistoryPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutsHistoryCubit(),
      child: const Scaffold(
        body: WorkoutsHistoryView(),
      ),
    );
  }    
}

/// {@template workouts_history_view}
/// Displays the Body of WorkoutsHistoryView
/// {@endtemplate}
class WorkoutsHistoryView extends StatelessWidget {
  /// {@macro workouts_history_view}
  const WorkoutsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkoutsHistoryBody();
  }
}
