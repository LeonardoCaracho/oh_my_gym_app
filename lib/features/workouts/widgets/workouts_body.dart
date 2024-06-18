import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

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
                  return WorkoutTile(
                    workout: state.workouts[index],
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
}
