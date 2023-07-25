import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ExerciseCardInput extends StatelessWidget {
  const ExerciseCardInput({
    super.key,
    this.hintText,
    this.onChanged,
  });

  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: UITextStyle.bodyText3,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 3,
        ),
        isDense: true,
        hintText: hintText,
        filled: true,
        fillColor: UIColors.white.withOpacity(0.5),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
