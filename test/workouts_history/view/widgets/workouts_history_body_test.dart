// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkoutsHistoryBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => WorkoutsHistoryCubit(),
          child: MaterialApp(home: WorkoutsHistoryBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
