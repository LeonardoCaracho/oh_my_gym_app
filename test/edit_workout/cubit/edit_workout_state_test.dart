// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';

void main() {
  group('EditWorkoutState', () {
    test('supports value equality', () {
      expect(
        EditWorkoutState(),
        equals(
          const EditWorkoutState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const EditWorkoutState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const editWorkoutState = EditWorkoutState(
            customProperty: 'My property',
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
          const editWorkoutState = EditWorkoutState(
            customProperty: 'My property',
          );
          final otherEditWorkoutState = EditWorkoutState(
            customProperty: 'My property 2',
          );
          expect(editWorkoutState, isNot(equals(otherEditWorkoutState)));

          expect(
            editWorkoutState.copyWith(
              customProperty: otherEditWorkoutState.customProperty,
            ),
            equals(otherEditWorkoutState),
          );
        },
      );
    });
  });
}
