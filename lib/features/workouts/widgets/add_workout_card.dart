import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

class AddWorkoutCard extends StatelessWidget {
  const AddWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    void updateWorkouts() {
      context.read<WorkoutsBloc>().add(const WorkoutsRequested());
    }

    return InkWell(
      onTap: () async {},
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              'Workouts',
              style: UITextStyle.headline4.copyWith(
                color: UIColors.white,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: DefaultButtonSmall(
              text: '+ Add',
              onPressed: () async {
                final shouldUpdate = await context.pushNamed<bool>(
                  RouteConstants.addWorkoutRouteName,
                );

                if (shouldUpdate ?? false) {
                  updateWorkouts();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
