import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/exercises/exercises.dart';
import 'package:workout_repository/workout_repository.dart';

class CreateExerciseBottomSheet extends StatefulWidget {
  const CreateExerciseBottomSheet({
    super.key,
  });

  @override
  State<CreateExerciseBottomSheet> createState() => _CreateExerciseBottomSheetState();
}

class _CreateExerciseBottomSheetState extends State<CreateExerciseBottomSheet> {
  List<Muscle> selected = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: AppColors.backgroundSecondary,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.close,
                  color: AppColors.primary,
                ),
              ),
              Text(
                'New exercise',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Icon(
                Icons.check,
                color: AppColors.primary,
              ),
            ],
          ),
          const ExerciseCardInput(
            hintText: 'Name',
          ),
          SelectDropdown<String>(
            placeholder: 'Muscle',
            options: Muscle.values.map((e) => e.displayName()).toList(),
            onChanged: (value) {
              print(value ?? '');
            },
          ),
          MultiSelectDropdown(
            hint: 'Secondary muscles',
            onChanged: (value) {
              print(value?.join('-'));
            },
          ),
          SelectDropdown<String>(
            placeholder: 'Type',
            options: Type.values.map((e) => e.displayName()).toList(),
            onChanged: (value) {
              print(value ?? '');
            },
          ),
        ],
      ),
    );
  }
}
