import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutOptionsBottomSheet extends StatelessWidget {
  const WorkoutOptionsBottomSheet({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    void updateWorkouts() {
      context.read<WorkoutsBloc>().add(const WorkoutsRequested());
    }

    void closeBottomSheet() {
      Navigator.pop(context);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height / 5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: ListTile.divideTiles(
                context: context,
                color: AppColors.background,
                tiles: [
                  ListTile(
                    dense: true,
                    title: Text(
                      'START',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: Icon(
                      Icons.play_arrow,
                      color: AppColors.primary,
                    ),
                    tileColor: AppColors.backgroundSecondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(14),
                        topLeft: Radius.circular(14),
                      ),
                    ),
                    onTap: () {
                      closeBottomSheet();
                      context.goNamed(
                        RouteConstants.startWorkoutRouteName,
                        extra: workout,
                      );
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      'EDIT',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: Icon(
                      Icons.edit_document,
                      color: AppColors.primary,
                    ),
                    tileColor: AppColors.backgroundSecondary,
                    onTap: () async {
                      closeBottomSheet();
                      final shouldUpdate = await context.pushNamed<bool>(
                        RouteConstants.editWorkoutRouteName,
                        extra: workout,
                      );

                      if (shouldUpdate ?? false) {
                        updateWorkouts();
                      }
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      'DELETE',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: Icon(
                      Icons.delete,
                      color: AppColors.primary,
                    ),
                    tileColor: AppColors.backgroundSecondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(14),
                        bottomLeft: Radius.circular(14),
                      ),
                    ),
                    onTap: () async {
                      closeBottomSheet();
                      await deleteConfirmationDialog(
                        context,
                        workout,
                      );
                    },
                  ),
                ],
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
