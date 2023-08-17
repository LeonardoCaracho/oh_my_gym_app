// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';

void main() {
  group('StartWorkoutCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          StartWorkoutCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final startWorkoutCubit = StartWorkoutCubit();
      expect(startWorkoutCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<StartWorkoutCubit, StartWorkoutState>(
      'yourCustomFunction emits nothing',
      build: StartWorkoutCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <StartWorkoutState>[],
    );
  });
}
