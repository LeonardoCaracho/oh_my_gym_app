import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

class WorkoutsBody extends StatelessWidget {
  const WorkoutsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyWorkoutsHeader(),
          const SizedBox(height: 30),
          Expanded(
            child: BlocBuilder<WorkoutsBloc, WorkoutsState>(
              builder: (context, state) {
                if (state is WorkoutsIsLoadSuccess) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: state.workouts.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const AddWorkoutCard();
                      }
                      return WorkoutCard(
                        workout: state.workouts[index - 1],
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
