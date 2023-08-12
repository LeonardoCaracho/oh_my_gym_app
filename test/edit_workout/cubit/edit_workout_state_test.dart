// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';
import 'package:workout_repository/workout_repository.dart';

class FakeWorkout extends Fake implements Workout {}

final mockWorkout = Workout.create();

void main() {
  setUpAll(() => registerFallbackValue(FakeWorkout()));
  group('EditWorkoutState', () {
    test('supports value equality', () {
      expect(
        EditWorkoutState(workout: mockWorkout),
        equals(
          EditWorkoutState(workout: mockWorkout),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          EditWorkoutState(workout: mockWorkout),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          final editWorkoutState = EditWorkoutState(
            workout: mockWorkout,
          );
          expect(
            editWorkoutState.copyWith(),
            equals(editWorkoutState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          final editWorkoutState = EditWorkoutState(
            workout: mockWorkout,
          );
          final otherEditWorkoutState = EditWorkoutState(
            workout: mockWorkout,
            status: Status.loading,
          );
          expect(editWorkoutState, isNot(equals(otherEditWorkoutState)));

          expect(
            editWorkoutState.copyWith(
              workout: mockWorkout,
              status: Status.loading,
            ),
            equals(otherEditWorkoutState),
          );
        },
      );
    });
  });
}
