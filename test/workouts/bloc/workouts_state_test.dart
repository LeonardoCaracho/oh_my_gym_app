import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';

import '../../helpers/mocks/mocks.dart';

void main() {
  group('WorkoutsState', () {
    // Test the WorkoutsInitial state
    test('WorkoutsInitial should be equatable', () {
      expect(const WorkoutsInitial(), const WorkoutsInitial());
    });

    // Test the WorkoutsIsLoading state
    test('WorkoutsIsLoading should be equatable', () {
      expect(const WorkoutsIsLoading(), const WorkoutsIsLoading());
    });

    // Test the WorkoutsIsLoadSuccess state
    test('WorkoutsIsLoadSuccess should be equatable', () {
      final workouts1 = [workoutMock];
      final workouts2 = [workoutMock];

      expect(
        WorkoutsIsLoadSuccess(workouts: workouts1),
        WorkoutsIsLoadSuccess(workouts: workouts2),
      );
    });

    // Test the WorkoutsIsLoadFailure state
    test('WorkoutsIsLoadFailure should be equatable', () {
      expect(const WorkoutsIsLoadFailure(), const WorkoutsIsLoadFailure());
    });

    // Test props method for all states
    test('props should return an empty list for all states', () {
      expect(const WorkoutsInitial().props, []);
      expect(const WorkoutsIsLoading().props, []);
      expect(const WorkoutsIsLoadSuccess(workouts: []).props, []);
      expect(const WorkoutsIsLoadFailure().props, []);
    });
  });
}
