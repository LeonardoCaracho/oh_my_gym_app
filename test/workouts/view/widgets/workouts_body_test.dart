// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

import '../../../helpers/mocks/mocks.dart';

class MockWorkoutsBloc extends MockCubit<WorkoutsState>
    implements WorkoutsBloc {}

void main() {
  late WorkoutsBloc workoutsBloc;

  setUp(() {
    workoutsBloc = MockWorkoutsBloc();

    when(() => workoutsBloc.state).thenReturn(
      WorkoutsIsLoadSuccess(
        workouts: [workoutMock],
      ),
    );
  });

  group('WorkoutsBody', () {
    testWidgets('renders screen', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => workoutsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: WorkoutsBody(),
            ),
          ),
        ),
      );

      expect(find.byType(AddWorkoutCard), findsNWidgets(1));
      expect(find.byType(WorkoutCard), findsNWidgets(1));
    });
  });
}
