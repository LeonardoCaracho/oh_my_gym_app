import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';
import 'package:workouts_api/workouts_api.dart';

class WorkoutHistoryBody extends StatelessWidget {
  const WorkoutHistoryBody({super.key});

  String dateFormatter(DateTime date) {
    return DateFormat('yMMMMEEEEd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsHistoryCubit, WorkoutsHistoryState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.recordsByWorkout.length,
                  itemBuilder: (context, index) {
                    final record = state.recordsByWorkout[index];

                    return ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      leading: const Icon(
                        Icons.date_range,
                        color: UIColors.white,
                      ),
                      title: Text(
                        dateFormatter(record.finishDate),
                        style: UITextStyle.bodyText3.copyWith(
                          color: UIColors.white,
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (context) {
                            return WorkoutRecordDetails(record: record);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class WorkoutRecordDetails extends StatelessWidget {
  const WorkoutRecordDetails({
    required this.record,
    super.key,
  });

  final WorkoutHistory record;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...record.workout.exercises.map(
            (exercise) => ExerciseDetails(
              exercise: exercise,
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({
    required this.exercise,
    super.key,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exercise.name,
            style: UITextStyle.bodyText3.copyWith(
              color: UIColors.white,
            ),
          ),
          const SizedBox(height: 8),
          ...exercise.sets.asMap().keys.toList().map(
                (index) => Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${index + 1}',
                        style: UITextStyle.bodyText3.copyWith(
                          color: UIColors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Reps: ${exercise.sets[index].reps}',
                        style: UITextStyle.bodyText3.copyWith(
                          color: UIColors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Weight: ${exercise.sets[index].weight}',
                        style: UITextStyle.bodyText3.copyWith(
                          color: UIColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
