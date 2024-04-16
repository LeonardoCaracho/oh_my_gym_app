import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:history_repository/history_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/start_workout/cubit/cubit.dart';
import 'package:workout_repository/workout_repository.dart';
import 'package:workouts_api/workouts_api.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

class MockWorkoutsContract extends Mock implements WorkoutsContract {}

class FakeHistoryWorkout extends Fake implements WorkoutHistory {}

class FakeWorkout extends Fake implements Workout {}

final mockExercise = Exercise.empty(id: '1');
final mockWorkout = Workout.create(exercises: [mockExercise]);

void main() {
  group('StartWorkoutCubit', () {
    late HistoryRepository historyRepository;
    late WorkoutsContract workoutsRepository;
    late StartWorkoutCubit startWorkoutCubit;

    setUpAll(() {
      registerFallbackValue(FakeHistoryWorkout());
      registerFallbackValue(FakeWorkout());
    });

    setUp(() {
      historyRepository = MockHistoryRepository();
      workoutsRepository = MockWorkoutsContract();

      startWorkoutCubit = StartWorkoutCubit(
        historyRepository: historyRepository,
        workoutsRepository: workoutsRepository,
      );

      when(() => workoutsRepository.updateWorkout(any())).thenAnswer(
        (_) => Future.value(),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          startWorkoutCubit,
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      expect(startWorkoutCubit.state.status, equals(Status.inital));
      expect(startWorkoutCubit.state.workout, equals(null));
    });

    blocTest<StartWorkoutCubit, StartWorkoutState>(
      'startWorkout emits state with selected workout',
      build: () => startWorkoutCubit,
      act: (cubit) => cubit.startWorkout(mockWorkout),
      expect: () => <StartWorkoutState>[
        StartWorkoutState(workout: mockWorkout),
      ],
    );

    blocTest<StartWorkoutCubit, StartWorkoutState>(
      'startWorkout emits correctly',
      seed: () => StartWorkoutState(workout: mockWorkout),
      build: () {
        when(() => historyRepository.saveRecord(any()))
            .thenAnswer((invocation) => Future.value());

        return startWorkoutCubit;
      },
      act: (cubit) => cubit.finishWorkout(),
      expect: () => <StartWorkoutState>[
        StartWorkoutState(workout: mockWorkout, status: Status.loading),
        StartWorkoutState(workout: mockWorkout, status: Status.success),
      ],
    );

    blocTest<StartWorkoutCubit, StartWorkoutState>(
      'finishWorkout don`t emit status success if there is not workout',
      build: () {
        when(() => historyRepository.saveRecord(any()))
            .thenAnswer((invocation) => Future.value());

        return startWorkoutCubit;
      },
      act: (cubit) => cubit.finishWorkout(),
      expect: () => <StartWorkoutState>[
        const StartWorkoutState(status: Status.loading),
      ],
    );
  });
}
