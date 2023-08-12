// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';
import 'package:workout_repository/workout_repository.dart';

class MockWorkoutsContracts extends Mock implements WorkoutsContract {}

class FakeWorkout extends Fake implements Workout {}

final mockExercise = Exercise.empty(id: '1');
final mockWorkout = Workout.create(exercises: [mockExercise]);

void main() {
  late WorkoutsContract workoutsRepository;
  late EditWorkoutCubit editWorkoutCubit;

  setUpAll(() => registerFallbackValue(FakeWorkout()));

  setUp(() {
    workoutsRepository = MockWorkoutsContracts();
    editWorkoutCubit = EditWorkoutCubit(
      EditWorkoutState(workout: mockWorkout),
      workoutsRepository: workoutsRepository,
    );
  });

  group('EditWorkoutCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          editWorkoutCubit,
          isNotNull,
        );
      });
    });

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'emits updated state with loading and success when saveWorkout succeeds',
      build: () => editWorkoutCubit,
      act: (cubit) async {
        when(() => workoutsRepository.saveWorkout(any()))
            .thenAnswer((_) => Future.value());
        await cubit.saveWorkout();
      },
      expect: () => [
        EditWorkoutState(workout: mockWorkout, status: Status.loading),
        EditWorkoutState(workout: mockWorkout, status: Status.success),
      ],
    );

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'emits updated state with loading and failure when saveWorkout fails',
      build: () => editWorkoutCubit,
      act: (cubit) async {
        when(() => workoutsRepository.saveWorkout(any()))
            .thenThrow(Exception('Test Error'));
        await cubit.saveWorkout();
      },
      expect: () => [
        EditWorkoutState(workout: mockWorkout, status: Status.loading),
        EditWorkoutState(workout: mockWorkout, status: Status.failure),
      ],
    );

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'emits updated state when deleteSet is called',
      build: () => editWorkoutCubit,
      seed: () => EditWorkoutState(
        workout: Workout.create(exercises: [mockExercise]),
      ),
      act: (cubit) {
        cubit.deleteSet(mockExercise.id, 0);
      },
      expect: () => [
        isA<EditWorkoutState>(),
      ],
    );

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'emits updated state when updateWorkout is called',
      seed: () => EditWorkoutState(
        workout: mockWorkout,
      ),
      build: () => editWorkoutCubit,
      act: (cubit) async {
        when(() => workoutsRepository.updateWorkout(any()))
            .thenAnswer((_) => Future.value());
        await cubit.updateWorkout();
      },
      expect: () => [
        EditWorkoutState(workout: mockWorkout, status: Status.loading),
        EditWorkoutState(workout: mockWorkout, status: Status.success),
      ],
    );

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'emits updated state with loading and failure when updateWorkout fails',
      seed: () => EditWorkoutState(
        workout: mockWorkout,
      ),
      build: () => editWorkoutCubit,
      act: (cubit) async {
        when(() => workoutsRepository.updateWorkout(any()))
            .thenThrow(Exception());
        await cubit.updateWorkout();
      },
      expect: () => [
        EditWorkoutState(workout: mockWorkout, status: Status.loading),
        EditWorkoutState(workout: mockWorkout, status: Status.failure),
      ],
    );

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'emits updated state when updateName is called',
      build: () => editWorkoutCubit,
      seed: () => EditWorkoutState(
        workout: Workout.create(exercises: [mockExercise]),
      ),
      act: (cubit) {
        cubit.updateName('name');
      },
      expect: () => [
        isA<EditWorkoutState>(),
      ],
    );

    blocTest<EditWorkoutCubit, EditWorkoutState>(
      'emits updated state when addExercise is called',
      build: () => editWorkoutCubit,
      seed: () => EditWorkoutState(
        workout: Workout.create(exercises: [mockExercise]),
      ),
      act: (cubit) {
        cubit.addExercise();
      },
      expect: () => [
        isA<EditWorkoutState>(),
      ],
    );
  });
}
