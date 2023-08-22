// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';

void main() {
  group('StartWorkoutState', () {
    test('supports value equality', () {
      expect(
        StartWorkoutState(),
        equals(
          const StartWorkoutState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const StartWorkoutState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const startWorkoutState = StartWorkoutState(
            customProperty: 'My property',
          );
          expect(
            startWorkoutState.copyWith(),
            equals(startWorkoutState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const startWorkoutState = StartWorkoutState(
            customProperty: 'My property',
          );
          final otherStartWorkoutState = StartWorkoutState(
            customProperty: 'My property 2',
          );
          expect(startWorkoutState, isNot(equals(otherStartWorkoutState)));

          expect(
            startWorkoutState.copyWith(
              customProperty: otherStartWorkoutState.customProperty,
            ),
            equals(otherStartWorkoutState),
          );
        },
      );
    });
  });
}
