// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/add_workout/cubit/cubit.dart';

void main() {
  group('AddWorkoutCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddWorkoutCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addWorkoutCubit = AddWorkoutCubit();
      expect(addWorkoutCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AddWorkoutCubit, AddWorkoutState>(
      'yourCustomFunction emits nothing',
      build: AddWorkoutCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AddWorkoutState>[],
    );
  });
}
