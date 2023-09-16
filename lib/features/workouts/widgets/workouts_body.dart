import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

class WorkoutsBody extends StatelessWidget {
  const WorkoutsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Text(
            'Start a workout',
            textAlign: TextAlign.start,
            style: UITextStyle.headline3.copyWith(
              color: UIColors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(8),
          child: AddWorkoutCard(),
        ),
        const Divider(
          color: UIColors.white,
          indent: 0,
          endIndent: 0,
        ),
        Expanded(
          child: BlocBuilder<WorkoutsBloc, WorkoutsState>(
            builder: (context, state) {
              if (state is WorkoutsIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is WorkoutsIsLoadSuccess) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                  ),
                );
              }

              if (state is WorkoutsIsLoadFailure) {
                return Center(
                  child: InkWell(
                    child: const Text('Error loading workouts!'),
                    onTap: () {
                      context.read<AppBloc>().add(const AppLogoutRequested());
                    },
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
