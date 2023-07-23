import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';

class AddWorkoutBody extends StatefulWidget {
  const AddWorkoutBody({super.key});

  @override
  State<AddWorkoutBody> createState() => _AddWorkoutBodyState();
}

class _AddWorkoutBodyState extends State<AddWorkoutBody> {
  // TextEditingController workoutNameController = TextEditingController();
  List<int> list = [1];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const AddWorkoutHeader(),
          const SizedBox(height: 30),
          const WorkoutNameInput(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: list.length + 1,
              itemBuilder: (_, index) {
                if (index == list.length) {
                  return DefaultButton(
                    text: 'Add Exercise',
                    icon: Icons.add,
                    onPressed: () => setState(() {
                      list.add(1);
                    }),
                  );
                }

                return const ExerciseCard();
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: 'Cancel',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: DefaultButton(
                  text: 'Save Workout',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
