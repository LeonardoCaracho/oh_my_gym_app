// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StartWorkoutPage', () {
    group('route', () {
      test('is routable', () {
        expect(StartWorkoutPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders StartWorkoutView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: StartWorkoutPage()));
      expect(find.byType(StartWorkoutView), findsOneWidget);
    });
  });
}
