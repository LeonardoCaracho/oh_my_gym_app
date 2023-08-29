// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:workouts_api/workouts_api.dart';

class MockEditWorkoutCubit extends MockCubit<EditWorkoutState>
    implements EditWorkoutCubit {}

void main() {
  late EditWorkoutCubit editWorkoutCubit;

  setUp(() {
    editWorkoutCubit = MockEditWorkoutCubit();
    when(() => editWorkoutCubit.state).thenReturn(
      EditWorkoutState(
        workout: Workout.create(),
      ),
    );
  });
  group('EditWorkoutBody', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => editWorkoutCubit,
          child: MaterialApp(
            home: Scaffold(
              body: EditWorkoutBody(),
            ),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsWidgets);
    });
  });
}
