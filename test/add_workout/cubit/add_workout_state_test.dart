// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/add_workout/cubit/cubit.dart';

void main() {
  group('AddWorkoutState', () {
    test('supports value equality', () {
      expect(
        AddWorkoutState(),
        equals(
          const AddWorkoutState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddWorkoutState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addWorkoutState = AddWorkoutState(
            customProperty: 'My property',
          );
          expect(
            addWorkoutState.copyWith(),
            equals(addWorkoutState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addWorkoutState = AddWorkoutState(
            customProperty: 'My property',
          );
          final otherAddWorkoutState = AddWorkoutState(
            customProperty: 'My property 2',
          );
          expect(addWorkoutState, isNot(equals(otherAddWorkoutState)));

          expect(
            addWorkoutState.copyWith(
              customProperty: otherAddWorkoutState.customProperty,
            ),
            equals(otherAddWorkoutState),
          );
        },
      );
    });
  });
}
