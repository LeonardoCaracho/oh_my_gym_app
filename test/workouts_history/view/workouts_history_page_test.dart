// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';

import '../../helpers/di_testing.dart';

class MockWorkoutsHistoryCubit extends MockCubit<WorkoutsHistoryState>
    implements WorkoutsHistoryCubit {}

void main() {
  late WorkoutsHistoryCubit cubit;

  group('WorkoutsHistoryPage', () {
    setUpAll(() async => initLocatorTesting());

    setUp(() {
      cubit = MockWorkoutsHistoryCubit();
      when(() => cubit.state).thenReturn(WorkoutsHistoryState());
    });

    tearDownAll(clearLocatorTesting);
    testWidgets('renders WorkoutHistoryPage', (tester) async {
      await tester.pumpWidget(
        BlocProvider<WorkoutsHistoryCubit>(
          create: (context) => cubit,
          child: Builder(
            builder: (context) {
              return MaterialApp(
                home: WorkoutHistoryPage(
                  workoutId: '1',
                ),
              );
            },
          ),
        ),
      );
      expect(find.byType(WorkoutHistoryPage), findsOneWidget);
    });
  });
}
