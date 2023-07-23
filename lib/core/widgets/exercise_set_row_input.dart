import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

class ExerciseSetRowInput extends StatelessWidget {
  const ExerciseSetRowInput({
    this.label,
    super.key,
  });

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label != null ? label! : '',
          style: UITextStyle.bodyText2,
        ),
        const SizedBox(
          width: 60,
          child: ExerciseCardInput(
            hintText: '0',
          ),
        ),
      ],
    );
  }
}
