import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

class ExerciseSetRowInput extends StatelessWidget {
  const ExerciseSetRowInput({
    this.label,
    this.onChanged,
    this.value,
    this.hint = '0',
    super.key,
  });

  final String? label;
  final String? value;
  final String hint;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label != null ? label! : '',
          style: UITextStyle.bodyText2,
        ),
        SizedBox(
          width: 60,
          child: ExerciseCardInput(
            hintText: hint,
            onChanged: onChanged,
            value: value,
          ),
        ),
      ],
    );
  }
}
