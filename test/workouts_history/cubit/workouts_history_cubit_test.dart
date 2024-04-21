import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';
import 'package:workout_repository/workout_repository.dart';

import '../../helpers/mocks/mocks.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

class FakeHistoryWorkout extends Fake implements WorkoutHistory {}

final mockExercise = Exercise.empty(id: '1');
final mockWorkout = Workout.create(exercises: [mockExercise]);

void main() {
  group('WorkoutsHistoryCubit', () {
    late HistoryRepository historyRepository;
    late WorkoutsHistoryCubit workoutsHistoryCubit;

    setUpAll(() => registerFallbackValue(FakeHistoryWorkout()));

    setUp(() {
      historyRepository = MockHistoryRepository();
      workoutsHistoryCubit =
          WorkoutsHistoryCubit(historyRepository: historyRepository);

      DateTimeMock.setMock(DateTime(2022));
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          WorkoutsHistoryCubit,
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      expect(workoutsHistoryCubit.state.status, equals(Status.inital));
      expect(workoutsHistoryCubit.state.records, equals([]));
    });

    blocTest<WorkoutsHistoryCubit, WorkoutsHistoryState>(
      'getRecords emits state with history workouts',
      build: () {
        when(() => historyRepository.getRecords())
            .thenAnswer((invocation) => Future.value([workoutHistoryMock]));

        return workoutsHistoryCubit;
      },
      act: (cubit) => cubit.getRecords(),
      expect: () => <WorkoutsHistoryState>[
        const WorkoutsHistoryState(
          status: Status.loading,
        ),
        WorkoutsHistoryState(
          status: Status.success,
          records: [workoutHistoryMock],
        ),
      ],
    );
  });
}
