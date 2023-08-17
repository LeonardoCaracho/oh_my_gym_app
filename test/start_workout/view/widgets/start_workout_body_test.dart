// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StartWorkoutBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => StartWorkoutCubit(),
          child: MaterialApp(home: StartWorkoutBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
