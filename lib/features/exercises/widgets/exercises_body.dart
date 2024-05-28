import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/exercises/exercises.dart';

class ExercisesBody extends StatelessWidget {
  const ExercisesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          centerTitle: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.all(8),
            expandedTitleScale: 1,
            title: ExercisesBodyHeader(),
          ),
        ),
      ],
    );
  }
}

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
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return const CreateExerciseBottomSheet();
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
