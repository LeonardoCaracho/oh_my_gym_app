// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkoutsHistoryPage', () {
    group('route', () {
      test('is routable', () {
        expect(WorkoutsHistoryPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders WorkoutsHistoryView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WorkoutsHistoryPage()));
      expect(find.byType(WorkoutsHistoryView), findsOneWidget);
    });
  });
}
