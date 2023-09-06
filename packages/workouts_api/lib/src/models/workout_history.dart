// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:workouts_api/workouts_api.dart';

part 'workout_history.g.dart';

@JsonSerializable(explicitToJson: true)
class WorkoutHistory extends Equatable {
  WorkoutHistory({
    required this.workout,
    required this.finishDate,
    this.docId,
  });

  factory WorkoutHistory.fromJson(Map<String, dynamic> json) =>
      _$WorkoutHistoryFromJson(json);

  final Workout workout;
  final DateTime finishDate;
  String? docId;

  @override
  List<Object?> get props => [workout, finishDate, docId];

  Map<String, dynamic> toJson() => _$WorkoutHistoryToJson(this);

  static String get collectionName => 'history';
}
