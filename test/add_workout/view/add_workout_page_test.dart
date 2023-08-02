// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';

import '../../helpers/helpers.dart';

void main() {
  setUpAll(() async => initLocatorTesting());

  tearDownAll(clearLocatorTesting);

  group('AddWorkoutPage', () {
    testWidgets('renders AddWorkoutView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddWorkoutPage()));
      expect(find.byType(AddWorkoutView), findsOneWidget);
    });
  });
}
