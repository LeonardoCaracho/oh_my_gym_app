// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddWorkoutBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddWorkoutCubit(),
          child: MaterialApp(home: AddWorkoutBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
