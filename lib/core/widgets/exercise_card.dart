import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

class ExerciseCard extends StatefulWidget {
  const ExerciseCard({super.key});

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  final list = [1];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.lightPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ExerciseCardInput(
                    hintText: 'Exercise name',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ExerciseCardInput(
                    hintText: 'Observations',
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return ExerciseSetRow(
                index: index + 1,
                deleteCallback: () {
                  list.removeLast();
                  setState(() {});
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DefaultButton(
              text: 'Add Set',
              icon: Icons.add,
              onPressed: () => setState(() {
                list.add(1);
              }),
            ),
          )
        ],
      ),
    );
  }
}
