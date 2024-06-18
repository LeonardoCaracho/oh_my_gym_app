import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/exercises/exercises.dart';
import 'package:oh_my_gym_app/features/settings/settings.dart';

class ExercisesBody extends StatelessWidget {
  const ExercisesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
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
        BlocBuilder<ExerciseTypeBloc, ExerciseTypeState>(
          builder: (context, state) {
            if (state is ExerciseTypeLoadInProgress) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is ExerciseTypeLoadFailure) {
              return const SliverFillRemaining(
                child: Center(child: Text('Empty')),
              );
            } else if (state is ExerciseTypeLoadSuccess) {
              return SliverList.builder(
                itemCount: state.exercises.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(state.exercises[index].toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      alignment: Alignment.centerRight,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.delete),
                      ),
                    ),
                    onDismissed: (direction) {
                      context.read<ExerciseTypeBloc>().add(ExerciseTypeDeleted(id: state.exercises[index].id!));
                    },
                    child: ExercisesTile(
                      exercise: state.exercises[index],
                    ),
                  );
                },
              );
            } else {
              return const SliverFillRemaining(
                child: SizedBox(),
              );
            }
          },
        ),
      ],
    );
  }
}
