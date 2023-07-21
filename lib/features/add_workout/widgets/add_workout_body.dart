import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

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
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(1),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: () {
                setState(() {});
                list.add(1);
              },
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Set',
                      style: UITextStyle.bodyText3,
                    ),
                    const Icon(Icons.add)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                return const ExerciseCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
