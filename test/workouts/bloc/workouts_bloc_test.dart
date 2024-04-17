// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';
import 'package:workout_repository/workout_repository.dart';

import '../../helpers/mocks/mocks.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  group('WorkoutsBloc', () {
    late WorkoutsBloc workoutsBloc;
    late WorkoutRepository mockWorkoutsRepository;

    setUp(() {
      mockWorkoutsRepository = MockWorkoutRepository();
      workoutsBloc = WorkoutsBloc(workoutsRepository: mockWorkoutsRepository);
    });

    tearDown(() {
      workoutsBloc.close();
    });

    test('initial state should be WorkoutsInitial', () {
      expect(workoutsBloc.state, const WorkoutsInitial());
    });

    blocTest<WorkoutsBloc, WorkoutsState>(
      'emits [WorkoutsIsLoading, WorkoutsIsLoadSuccess] when event is added',
      build: () {
        when(() => mockWorkoutsRepository.getWorkouts()).thenAnswer(
          (_) => Future.value([workoutMock]),
        );
        return workoutsBloc;
      },
      act: (bloc) => bloc.add(WorkoutsRequested()),
      expect: () => [
        const WorkoutsIsLoading(),
        WorkoutsIsLoadSuccess(workouts: [workoutMock]),
      ],
    );

    blocTest<WorkoutsBloc, WorkoutsState>(
      'emits [WorkoutsIsLoading, WorkoutsIsLoadFailure] when event fails',
      build: () {
        when(() => mockWorkoutsRepository.getWorkouts())
            .thenThrow(Exception('Failed to load workouts'));
        return workoutsBloc;
      },
      act: (bloc) => bloc.add(WorkoutsRequested()),
      expect: () => [
        const WorkoutsIsLoading(),
        const WorkoutsIsLoadFailure(),
      ],
    );

    blocTest<WorkoutsBloc, WorkoutsState>(
      'emits [WorkoutRemoveIsLoading, WorkoutsIsLoadSuccess] when event is added',
      build: () {
        when(() => mockWorkoutsRepository.getWorkouts()).thenAnswer(
          (_) => Future.value([workoutMock]),
        );
        when(() => mockWorkoutsRepository.deleteWorkout(workoutMock.docId!))
            .thenAnswer(
          (_) => Future.value(),
        );
        return workoutsBloc;
      },
      act: (bloc) => bloc.add(WorkoutRemoved(workout: workoutMock)),
      expect: () => [
        const WorkoutRemoveIsLoading(),
        WorkoutsIsLoadSuccess(workouts: [workoutMock]),
      ],
    );

    blocTest<WorkoutsBloc, WorkoutsState>(
      'emits [WorkoutRemoveIsLoading, WorkoutsIsLoadSuccess] when event fails',
      build: () {
        when(() => mockWorkoutsRepository.deleteWorkout(workoutMock.docId!))
            .thenThrow(
          Exception(),
        );
        return workoutsBloc;
      },
      act: (bloc) => bloc.add(WorkoutRemoved(workout: workoutMock)),
      expect: () => [
        const WorkoutRemoveIsLoading(),
        WorkoutsIsLoadFailure(),
      ],
    );
  });
}
