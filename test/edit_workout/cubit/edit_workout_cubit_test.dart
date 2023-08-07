// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';

void main() {
  group('EditWorkoutCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          EditWorkoutCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final editWorkoutCubit = EditWorkoutCubit();
      expect(editWorkoutCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'yourCustomFunction emits nothing',
      build: EditWorkoutCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <EditWorkoutState>[],
    );
  });
}
