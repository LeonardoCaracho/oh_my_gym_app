// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';

void main() {
  group('WorkoutsHistoryState', () {
    test('supports value equality', () {
      expect(
        WorkoutsHistoryState(),
        equals(
          const WorkoutsHistoryState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const WorkoutsHistoryState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const workoutsHistoryState = WorkoutsHistoryState();
          expect(
            workoutsHistoryState.copyWith(),
            equals(workoutsHistoryState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const workoutsHistoryState = WorkoutsHistoryState();
          final otherWorkoutsHistoryState = WorkoutsHistoryState(
            status: Status.loading,
          );
          expect(
              workoutsHistoryState, isNot(equals(otherWorkoutsHistoryState)));

          expect(
            workoutsHistoryState.copyWith(
              status: otherWorkoutsHistoryState.status,
            ),
            equals(otherWorkoutsHistoryState),
          );
        },
      );
    });
  });
}
