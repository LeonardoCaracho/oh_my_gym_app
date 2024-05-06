import 'package:equatable/equatable.dart';

class Series extends Equatable {
  Series({
    required this.isDone,
    this.reps,
    this.weight,
    this.prevReps,
    this.prevWeight,
    this.id,
  });

  factory Series.empty() => Series(
        reps: 0,
        weight: 0,
        isDone: false,
      );

  int? id;
  int? reps;
  double? weight;
  int? prevReps;
  double? prevWeight;
  bool isDone;

  @override
  List<Object?> get props => [isDone, reps, weight, prevReps, prevWeight, id];
}
