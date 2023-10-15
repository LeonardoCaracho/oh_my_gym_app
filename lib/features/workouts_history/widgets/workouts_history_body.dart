import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';

class WorkoutsHistoryBody extends StatelessWidget {
  const WorkoutsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsHistoryCubit, WorkoutsHistoryState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.records.length,
                  itemBuilder: (context, index) {
                    return WorkoutRecordDetails(
                      record: state.records[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
