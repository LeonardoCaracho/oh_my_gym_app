import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class WorkoutNameInput extends StatelessWidget {
  const WorkoutNameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: UITextStyle.button,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: 'Workout name',
        filled: true,
        fillColor: UIColors.black.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 3,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
