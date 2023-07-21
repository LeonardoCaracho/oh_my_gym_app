import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ExerciseSetRowInput extends StatelessWidget {
  const ExerciseSetRowInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: UITextStyle.bodyText2,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        isDense: true,
        hintText: '0',
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
