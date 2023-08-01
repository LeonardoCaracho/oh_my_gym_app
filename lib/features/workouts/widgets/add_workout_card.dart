import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';

class AddWorkoutCard extends StatelessWidget {
  const AddWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          RouteConstants.addWorkoutRouteName,
        );
      },
      child: Card(
        color: UIColors.lightPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.add,
          size: 64,
        ),
      ),
    );
  }
}
