// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';
import 'package:workout_repository/workout_repository.dart';

import '../../helpers/di_testing.dart';

void main() {
  group('StartWorkoutPage', () {
    setUpAll(() async => initLocatorTesting());

    tearDownAll(clearLocatorTesting);
    testWidgets('renders StartWorkoutView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: StartWorkoutPage(
            workout: Workout.create(),
          ),
        ),
      );
      expect(find.byType(StartWorkoutView), findsOneWidget);
    });
  });
}
