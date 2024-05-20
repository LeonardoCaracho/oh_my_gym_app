import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutsBody extends StatelessWidget {
  const WorkoutsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          centerTitle: false,
          // expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.all(8),
            expandedTitleScale: 1,
            title: AddWorkoutCard(),
          ),
        ),
        BlocBuilder<WorkoutsBloc, WorkoutsState>(
          builder: (context, state) {
            if (state is WorkoutsIsLoadFailure) {
              return SliverFillRemaining(
                child: Center(
                  child: InkWell(
                    child: const Text('Error loading workouts!'),
                    onTap: () {
                      context.read<AppBloc>().add(const AppLogoutRequested());
                    },
                  ),
                ),
              );
            }

            if (state is WorkoutsIsLoading || state is WorkoutRemoveIsLoading) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state is WorkoutsIsLoadSuccess) {
              if (state.workouts.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text(
                      '🐔',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                );
              }

              return SliverList.builder(
                itemCount: state.workouts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.workouts[index].name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Exercises: X',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Sets: X',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    onTap: () async {
                      final workoutsBloc = context.read<WorkoutsBloc>();
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: workoutsBloc,
                            child: WorkoutOptionsBottomSheet(
                              workout: state.workouts[index],
                            ),
                          );
                        },
                      );

                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return FullScreenModal(
                      //       workout: state.workouts[index],
                      //     );
                      //   },
                      // );

                      // final shouldUpdate = await Navigator.of(context, rootNavigator: true).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => StartWorkoutPage(workout: state.workouts[index]),
                      //     fullscreenDialog: true,
                      //   ),
                      // );

                      // final shouldUpdate = await context.pushNamed<bool>(
                      //   RouteConstants.editWorkoutRouteName,
                      //   extra: state.workouts[index],
                      // );

                      // if (shouldUpdate != null) {
                      //   context.read<WorkoutsBloc>().add(const WorkoutsRequested());
                      // }
                    },
                  );
                },
              );
            }
            return const SliverFillRemaining(child: SizedBox.shrink());
          },
        ),
      ],
    );
  }

  String _getTotalSets(List<Exercise> exercises) {
    return exercises
        .fold(
          0,
          (previousValue, element) => previousValue + element.sets.length,
        )
        .toString();
  }
}

class FullScreenModal extends StatelessWidget {
  const FullScreenModal({super.key, required this.workout});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Inflated with the device screen
      insetPadding: EdgeInsets.all(0),
      child: StartWorkoutPage(
        workout: workout,
      ),
    );
  }
}
