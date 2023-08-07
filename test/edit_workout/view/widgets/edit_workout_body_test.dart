// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EditWorkoutBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => EditWorkoutCubit(),
          child: MaterialApp(home: EditWorkoutBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
