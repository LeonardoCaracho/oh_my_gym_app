// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';

void main() {
  group('WorkoutsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          WorkoutsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final workoutsBloc = WorkoutsBloc();
      expect(workoutsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<WorkoutsBloc, WorkoutsState>(
      'CustomWorkoutsEvent emits nothing',
      build: WorkoutsBloc.new,
      act: (bloc) => bloc.add(const CustomWorkoutsEvent()),
      expect: () => <WorkoutsState>[],
    );
  });
}
