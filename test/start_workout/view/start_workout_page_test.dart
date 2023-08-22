// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';

import '../../edit_workout/cubit/edit_workout_cubit_test.dart';

void main() {
  group('StartWorkoutPage', () {
    testWidgets('renders StartWorkoutView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: StartWorkoutPage(
            workout: mockWorkout,
          ),
        ),
      );
      expect(find.byType(StartWorkoutView), findsOneWidget);
    });
  });
}
