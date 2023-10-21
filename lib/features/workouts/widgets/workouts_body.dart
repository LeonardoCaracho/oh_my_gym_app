import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

class WorkoutsBody extends StatelessWidget {
  const WorkoutsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          centerTitle: false,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.all(8),
            expandedTitleScale: 1,
            background: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start a workout',
                    style: UITextStyle.headline3.copyWith(
                      color: UIColors.white,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () => context
                        .goNamed(RouteConstants.settingsHistoryRouteName),
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
            ),
            title: const AddWorkoutCard(),
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

            if (state is WorkoutsIsLoading) {
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

              return SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.4,
                ),
                itemCount: state.workouts.length,
                itemBuilder: (context, index) {
                  return WorkoutCard(
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
