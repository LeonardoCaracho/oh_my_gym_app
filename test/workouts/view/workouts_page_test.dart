// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

import '../../helpers/helpers.dart';
import 'widgets/workouts_body_test.dart';

void main() {
  late WorkoutsBloc workoutsBloc;

  setUp(() {
    workoutsBloc = MockWorkoutsBloc();
    when(() => workoutsBloc.state).thenReturn(WorkoutsInitial());
  });

  setUpAll(() async => initLocatorTesting());
  tearDownAll(clearLocatorTesting);
  group('WorkoutsPage', () {
    testWidgets('renders WorkoutsView', (tester) async {
      await tester.pumpWidget(
        BlocProvider<WorkoutsBloc>.value(
          value: workoutsBloc,
          child: MaterialApp(home: WorkoutsPage()),
        ),
      );
      expect(find.byType(WorkoutsView), findsOneWidget);
    });
  });
}
