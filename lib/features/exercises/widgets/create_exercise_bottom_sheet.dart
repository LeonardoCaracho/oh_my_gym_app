import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
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
  List<Muscle> secondaryMuscles = [];
  Muscle? muscle;
  Type? type;
  String name = '';

  bool checkIfExerciseIsValid() {
    return muscle != null && type != null && name.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final exercisesTypeBloc = context.read<ExerciseTypeBloc>();

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
              InkWell(
                onTap: checkIfExerciseIsValid()
                    ? () {
                        exercisesTypeBloc.add(
                          ExerciseTypeCreated(
                            exercise: ExerciseTypeCreate(
                              name: name,
                              muscle: muscle!,
                              secondaryMuscle: secondaryMuscles,
                              type: type!,
                            ),
                          ),
                        );

                        Navigator.pop(context);
                      }
                    : null,
                child: Icon(
                  Icons.check,
                  color: checkIfExerciseIsValid() ? AppColors.primary : Colors.grey,
                ),
              ),
            ],
          ),
          ExerciseCardInput(
            hintText: 'Name',
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          SelectDropdown<Muscle>(
            placeholder: 'Muscle',
            options: Muscle.values.map((e) => DropdownOption<Muscle>(value: e, title: e.displayName())).toList(),
            onChanged: (value) {
              setState(() {
                muscle = value?.value;
              });
            },
          ),
          MultiSelectDropdown(
            hint: 'Secondary muscles',
            onChanged: (value) {
              setState(() {
                secondaryMuscles = value ?? [];
              });
            },
          ),
          SelectDropdown<Type>(
            placeholder: 'Type',
            options: Type.values.map((e) => DropdownOption<Type>(value: e, title: e.displayName())).toList(),
            onChanged: (value) {
              setState(() {
                type = value?.value;
              });
            },
          ),
        ],
      ),
    );
  }
}
