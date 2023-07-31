// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/add_workout/cubit/cubit.dart';
import 'package:workout_repository/workout_repository.dart';

class MockWorkoutsRepository extends Mock implements WorkoutsContract {}

class WorkoutFake extends Fake implements Workout {}

void main() {
  group('AddWorkoutCubit', () {
    late AddWorkoutCubit addWorkoutCubit;
    late WorkoutsContract mockWorkoutsRepository;

    late List<Exercise> exercises;

    setUpAll(() {
      registerFallbackValue(WorkoutFake());
    });

    setUp(() {
      DateTimeMock.setMock(DateTime(2023, 7, 30));
      exercises = [Exercise.empty(id: '1')];
      mockWorkoutsRepository = MockWorkoutsRepository();
      addWorkoutCubit =
          AddWorkoutCubit(workoutsRepository: mockWorkoutsRepository);
    });

    tearDown(() {
      addWorkoutCubit.close();
    });

    test('initial state is correct', () {
      expect(addWorkoutCubit.state, AddWorkoutState());
    });

    blocTest<AddWorkoutCubit, AddWorkoutState>(
      'emits updated state when updateName is called',
      build: () => addWorkoutCubit,
      act: (cubit) => cubit.updateName('Test Workout'),
      expect: () => [AddWorkoutState(workoutName: 'Test Workout')],
    );

    blocTest<AddWorkoutCubit, AddWorkoutState>(
      'emits updated state when addExercise is called',
      build: () => addWorkoutCubit,
      act: (cubit) => cubit.addExercise(),
      verify: (cubit) => cubit.state.exercises.isNotEmpty,
    );

    blocTest<AddWorkoutCubit, AddWorkoutState>(
      'emits updated state when addSet is called',
      seed: () => AddWorkoutState(
        exercises: exercises,
      ),
      build: () {
        return addWorkoutCubit;
      },
      act: (cubit) {
        cubit.addSet(exercises.first);
      },
      expect: () => [
        AddWorkoutState(
          exercises: [
            Exercise(
              id: '1',
              name: '',
              observation: '',
              sets: [ExerciseSet.empty(), ExerciseSet.empty()],
            )
          ],
          timestamp: DateTimeMock.current.millisecondsSinceEpoch,
        ),
      ],
    );

    blocTest<AddWorkoutCubit, AddWorkoutState>(
      'emits updated state when deleteSet is called',
      build: () => addWorkoutCubit,
      seed: () => AddWorkoutState(
        exercises: exercises,
      ),
      act: (cubit) {
        cubit.deleteSet(exercises.first, 0);
      },
      expect: () => [
        AddWorkoutState(
          timestamp: DateTimeMock.current.millisecondsSinceEpoch,
        ),
      ],
    );

    blocTest<AddWorkoutCubit, AddWorkoutState>(
      'emits updated state with loading and success when saveWorkout succeeds',
      build: () => addWorkoutCubit,
      act: (cubit) async {
        when(() => mockWorkoutsRepository.saveWorkout(any()))
            .thenAnswer((_) => Future.value());
        await cubit.saveWorkout();
      },
      expect: () => [
        AddWorkoutState(status: Status.loading),
        AddWorkoutState(status: Status.success),
      ],
    );

    blocTest<AddWorkoutCubit, AddWorkoutState>(
      'emits updated state with loading and failure when saveWorkout fails',
      build: () => addWorkoutCubit,
      act: (cubit) async {
        // Stub the repository method to throw an error.
        when(() => mockWorkoutsRepository.saveWorkout(any()))
            .thenThrow(Exception('Test Error'));
        await cubit.saveWorkout();
      },
      expect: () => [
        AddWorkoutState(status: Status.loading),
        AddWorkoutState(status: Status.failure),
      ],
    );
  });
}
