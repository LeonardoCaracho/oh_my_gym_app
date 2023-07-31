import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';

class MockAddWorkoutCubit extends MockCubit<AddWorkoutState>
    implements AddWorkoutCubit {}

void main() {
  group('AddWorkoutBody', () {
    late AddWorkoutCubit addWorkoutCubit;

    setUp(() {
      addWorkoutCubit = MockAddWorkoutCubit();
      when(() => addWorkoutCubit.state).thenReturn(const AddWorkoutState());
    });

    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: addWorkoutCubit,
          child: const MaterialApp(
            home: Scaffold(
              body: AddWorkoutBody(),
            ),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsNWidgets(2));
    });
  });
}
