import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
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
                  itemCount: state.recordsGrouped.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.recordsGrouped[index].workout.name,
                      ),
                      subtitle: Text(state.recordsGrouped[index].workout.id),
                      onTap: () {
                        context.goNamed(
                          RouteConstants.workoutHistoryRouteName,
                          queryParameters: {
                            'docId': state.recordsGrouped[index].workout.docId,
                          },
                        );
                      },
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
