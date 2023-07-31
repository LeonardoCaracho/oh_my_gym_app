import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';

// ignore: must_be_immutable
class WorkoutNameInput extends StatelessWidget {
  WorkoutNameInput({
    super.key,
  });

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: UITextStyle.button,
      textAlign: TextAlign.center,
      onChanged: (text) {
        if (_timer?.isActive ?? false) _timer?.cancel();
        _timer = Timer(const Duration(milliseconds: 500), () {
          context.read<AddWorkoutCubit>().updateName(text);
        });
      },
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
