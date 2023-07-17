// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddWorkoutPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddWorkoutPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddWorkoutView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddWorkoutPage()));
      expect(find.byType(AddWorkoutView), findsOneWidget);
    });
  });
}
