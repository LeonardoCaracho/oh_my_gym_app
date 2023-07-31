// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

void main() {
  group('WorkoutsBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => WorkoutsBloc(),
          child: MaterialApp(home: WorkoutsBody()),
        ),
      );

      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}
