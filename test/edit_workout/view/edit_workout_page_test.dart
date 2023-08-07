// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EditWorkoutPage', () {
    group('route', () {
      test('is routable', () {
        expect(EditWorkoutPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders EditWorkoutView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EditWorkoutPage()));
      expect(find.byType(EditWorkoutView), findsOneWidget);
    });
  });
}
