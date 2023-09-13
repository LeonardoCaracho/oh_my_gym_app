import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:history_repository/history_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';
import 'package:workouts_api/workouts_api.dart';

import '../../helpers/mocks/mocks.dart';

class MockHistoryContract extends Mock implements HistoryContract {}

class FakeHistoryWorkout extends Fake implements WorkoutHistory {}

final mockExercise = Exercise.empty(id: '1');
final mockWorkout = Workout.create(exercises: [mockExercise]);

// const workoutHistoryMock = WorkoutHistory(finishDate: DateTime)

void main() {
  group('WorkoutsHistoryCubit', () {
    late HistoryContract historyRepository;
    late WorkoutsHistoryCubit workoutsHistoryCubit;

    setUpAll(() => registerFallbackValue(FakeHistoryWorkout()));

    setUp(() {
      historyRepository = MockHistoryContract();
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
      expect(workoutsHistoryCubit.state.recordsByWorkout, equals([]));
      expect(workoutsHistoryCubit.state.recordsGrouped, equals([]));
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
          recordsGrouped: [workoutHistoryMock],
        ),
      ],
    );

    blocTest<WorkoutsHistoryCubit, WorkoutsHistoryState>(
      'getRecords emits state with history workouts',
      build: () {
        return workoutsHistoryCubit;
      },
      act: (cubit) => cubit.getRecordsByWorkout('1'),
      expect: () => <WorkoutsHistoryState>[
        const WorkoutsHistoryState(),
      ],
    );
  });
}
