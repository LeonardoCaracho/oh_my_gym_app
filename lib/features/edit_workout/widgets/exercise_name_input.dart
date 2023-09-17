import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';

// ignore: must_be_immutable
class ExerciseNameInput extends StatefulWidget {
  const ExerciseNameInput({
    super.key,
    this.value,
  });

  final String? value;

  @override
  State<ExerciseNameInput> createState() => _ExerciseNameInputState();
}

class _ExerciseNameInputState extends State<ExerciseNameInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.value ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: TextField(
            controller: _controller,
            style: UITextStyle.subtitle2,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Add Exercise',
              filled: true,
              isDense: true,
              fillColor: UIColors.lightDark,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: DefaultButton(
            text: '',
            icon: Icons.add,
            onPressed: () =>
                context.read<EditWorkoutCubit>().addExercise(_controller.text),
          ),
        ),
      ],
    );
  }
}
