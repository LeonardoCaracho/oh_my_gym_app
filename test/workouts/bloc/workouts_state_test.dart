// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';

void main() {
  group('WorkoutsState', () {
    test('supports value equality', () {
      expect(
        WorkoutsState(),
        equals(
          const WorkoutsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const WorkoutsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const workoutsState = WorkoutsState(
            customProperty: 'My property',
          );
          expect(
            workoutsState.copyWith(),
            equals(workoutsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const workoutsState = WorkoutsState(
            customProperty: 'My property',
          );
          final otherWorkoutsState = WorkoutsState(
            customProperty: 'My property 2',
          );
          expect(workoutsState, isNot(equals(otherWorkoutsState)));

          expect(
            workoutsState.copyWith(
              customProperty: otherWorkoutsState.customProperty,
            ),
            equals(otherWorkoutsState),
          );
        },
      );
    });
  });
}
