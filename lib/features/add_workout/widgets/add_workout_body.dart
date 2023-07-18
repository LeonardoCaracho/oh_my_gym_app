import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

class AddWorkoutBody extends StatelessWidget {
  const AddWorkoutBody({super.key});

  // TextEditingController workoutNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: UISpacing.lg,
              bottom: UISpacing.xxlg,
            ),
            child: Text(
              'Add my Workout',
              style: UITextStyle.headline3,
            ),
          ),
          TextField(
            style: UITextStyle.headline4,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Workout name',
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ExerciseCard(),
                ExerciseCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
