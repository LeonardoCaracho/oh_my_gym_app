// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';

void main() {
  group('WorkoutsHistoryCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          WorkoutsHistoryCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final workoutsHistoryCubit = WorkoutsHistoryCubit();
      expect(workoutsHistoryCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<WorkoutsHistoryCubit, WorkoutsHistoryState>(
      'yourCustomFunction emits nothing',
      build: WorkoutsHistoryCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <WorkoutsHistoryState>[],
    );
  });
}
