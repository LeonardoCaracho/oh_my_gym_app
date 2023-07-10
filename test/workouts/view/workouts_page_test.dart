// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkoutsPage', () {
    group('route', () {
      test('is routable', () {
        expect(WorkoutsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders WorkoutsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WorkoutsPage()));
      expect(find.byType(WorkoutsView), findsOneWidget);
    });
  });
}
