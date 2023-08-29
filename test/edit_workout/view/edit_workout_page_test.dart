// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:workouts_api/workouts_api.dart';

import '../../helpers/di_testing.dart';

void main() {
  group('EditWorkoutPage', () {
    setUpAll(() async => initLocatorTesting());

    tearDownAll(clearLocatorTesting);
    testWidgets('renders EditWorkoutView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EditWorkoutPage(
            workout: Workout.create(),
          ),
        ),
      );
      expect(find.byType(EditWorkoutView), findsOneWidget);
    });
  });
}
