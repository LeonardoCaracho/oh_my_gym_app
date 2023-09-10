import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';

class WorkoutHistoryBody extends StatelessWidget {
  const WorkoutHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsHistoryCubit, WorkoutsHistoryState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.recordsByWorkout.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.recordsByWorkout[index].workout.name,
                      ),
                      subtitle: Text(state.recordsByWorkout[index].workout.id),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
