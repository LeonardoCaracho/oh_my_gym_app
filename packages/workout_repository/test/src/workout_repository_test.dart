// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:workout_repository/workout_repository.dart';

void main() {
  group('WorkoutRepository', () {
    test('can be instantiated', () {
      expect(WorkoutRepository(), isNotNull);
    });
  });
}
