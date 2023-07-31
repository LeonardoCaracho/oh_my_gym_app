import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AddWorkoutHeader extends StatelessWidget {
  const AddWorkoutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'ADD MY WORKOUT',
      style: UITextStyle.headline3,
    );
  }
}
