import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';

import '../../helpers/mocks/mocks.dart';
import 'workouts_state_test.dart';

void main() {
  group('WorkoutsEvent', () {
    // Test the WorkoutsEvent class
    test('WorkoutsEvent should be equatable', () {
      expect(const WorkoutsEvent(), const WorkoutsEvent());
    });

    // Test props method for WorkoutsEvent
    test('props should return an empty list for WorkoutsEvent', () {
      expect(const WorkoutsEvent().props, empty);
    });
  });

  group('WorkoutsRequested', () {
    // Test the WorkoutsRequested class
    test('WorkoutsRequested should be equatable', () {
      expect(const WorkoutsRequested(), const WorkoutsRequested());
    });

    // Test props method for WorkoutsRequested
    test('props should return an empty list for WorkoutsRequested', () {
      expect(const WorkoutsRequested().props, empty);
    });
  });

  group('WorkoutRemoved', () {
    // Test the WorkoutsRequested class
    test('WorkoutRemoved should be equatable', () {
      expect(
        WorkoutRemoved(workout: workoutMock),
        WorkoutRemoved(workout: workoutMock),
      );
    });

    // Test props method for WorkoutRemoved
    test('props should return an empty list for WorkoutRemoved', () {
      expect(WorkoutRemoved(workout: workoutMock).props, [workoutMock]);
    });
  });
}
