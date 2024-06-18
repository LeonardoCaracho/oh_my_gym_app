import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/exercises/exercises.dart';
import 'package:oh_my_gym_app/features/settings/cubit/cubit.dart';

class ExercisesBodyHeader extends StatelessWidget {
  const ExercisesBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              'Exercises',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            flex: 3,
            child: DefaultButtonSmall(
              text: '+ Add',
              onPressed: () async {
                final exercisesBloc = context.read<ExerciseTypeBloc>();
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return BlocProvider.value(
                      value: exercisesBloc,
                      child: const CreateExerciseBottomSheet(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
