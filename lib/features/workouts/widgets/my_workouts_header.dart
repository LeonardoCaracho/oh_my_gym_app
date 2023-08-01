import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MyWorkoutsHeader extends StatelessWidget {
  const MyWorkoutsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'MY WORKOUTS',
      style: UITextStyle.headline3,
    );
  }
}
