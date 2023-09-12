// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';

class MockWorkoutsHistoryCubit extends MockCubit<WorkoutsHistoryState>
    implements WorkoutsHistoryCubit {}

void main() {
  late WorkoutsHistoryCubit cubit;

  setUp(() {
    cubit = MockWorkoutsHistoryCubit();
    when(() => cubit.state).thenReturn(WorkoutsHistoryState());
  });

  group('WorkoutsHistoryBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => cubit,
          child: MaterialApp(home: WorkoutsHistoryBody()),
        ),
      );

      expect(find.byType(WorkoutsHistoryBody), findsOneWidget);
    });
  });
}
