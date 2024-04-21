// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';
import 'package:workout_repository/workout_repository.dart';

class MockStartWorkoutCubit extends MockCubit<StartWorkoutState>
    implements StartWorkoutCubit {}

void main() {
  late StartWorkoutCubit startWorkoutCubit;

  setUp(() {
    startWorkoutCubit = MockStartWorkoutCubit();
    when(() => startWorkoutCubit.state).thenReturn(
      StartWorkoutState(
        workout: Workout.create(),
      ),
    );
  });
  group('StartWorkoutBody', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => startWorkoutCubit,
          child: MaterialApp(
            home: Scaffold(
              body: StartWorkoutBody(
                workout: Workout.create(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(StartWorkoutBody), findsWidgets);
    });
  });
}
