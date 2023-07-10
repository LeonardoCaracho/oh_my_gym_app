// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';

void main() {
  group('WorkoutsEvent', () {  
    group('CustomWorkoutsEvent', () {
      test('supports value equality', () {
        expect(
          CustomWorkoutsEvent(),
          equals(const CustomWorkoutsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomWorkoutsEvent(),
          isNotNull
        );
      });
    });
  });
}
