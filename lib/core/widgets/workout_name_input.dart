import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';

// ignore: must_be_immutable
class WorkoutNameInput extends StatefulWidget {
  const WorkoutNameInput({
    super.key,
    this.value,
  });

  final String? value;

  @override
  State<WorkoutNameInput> createState() => _WorkoutNameInputState();
}

class _WorkoutNameInputState extends State<WorkoutNameInput> {
  Timer? _timer;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.value ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
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
