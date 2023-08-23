import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

class BottomWorkoutStart extends StatelessWidget {
  const BottomWorkoutStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: UIColors.lightPurple,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            'The timer is running baby!',
            style: UITextStyle.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              '00:00',
              style: UITextStyle.headline3,
            ),
          ),
          const Row(
            children: [
              SizedBox(width: 20),
              Expanded(child: DefaultButton(text: 'PAUSE')),
              SizedBox(width: 20),
              Expanded(child: DefaultButton(text: 'FINISH')),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
