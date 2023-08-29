import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:workouts_api/workouts_api.dart';

part 'workout_history.g.dart';

@JsonSerializable(explicitToJson: true)
class WorkoutHistory extends Equatable {
  const WorkoutHistory({
    required this.workout,
    required this.finishDate,
  });

  factory WorkoutHistory.fromJson(Map<String, dynamic> json) =>
      _$WorkoutHistoryFromJson(json);

  final Workout workout;
  final DateTime finishDate;

  @override
  List<Object?> get props => [workout, finishDate];
}
