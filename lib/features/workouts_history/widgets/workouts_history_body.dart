import 'package:app_ui/app_ui.dart';
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
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    color: UIColors.white,
                  ),
                  itemCount: state.recordsGrouped.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: UIColors.white,
                      ),
                      title: Text(
                        state.recordsGrouped[index].workout.name,
                        style: UITextStyle.bodyText3.copyWith(
                          color: UIColors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Number of sessions: X',
                        style: UITextStyle.bodyText3.copyWith(
                          color: UIColors.white,
                        ),
                      ),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
