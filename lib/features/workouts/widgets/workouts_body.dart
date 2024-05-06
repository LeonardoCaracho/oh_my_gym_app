import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/app/app.dart';
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
            // background: Padding(
            //   padding: EdgeInsets.all(8),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Start a workout',
            //       ),
            //     ],
            //   ),
            // ),
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
