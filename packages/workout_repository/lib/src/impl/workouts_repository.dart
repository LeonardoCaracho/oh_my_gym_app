import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'package:workout_repository/src/contracts/contracts.dart';
import 'package:workout_repository/src/models/workout.dart';

class WorkoutRepository implements WorkoutsContract {
  WorkoutRepository({
    required this.authRepository,
    firebase_firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? firebase_firestore.FirebaseFirestore.instance;

  final firebase_firestore.FirebaseFirestore _firebaseFirestore;
  final AuthenticationContract authRepository;

  @override
  Future<void> saveWorkout(Workout workout) async {
    final user = authRepository.currentUser;

    await _firebaseFirestore.collection(user.id).add(workout.toJson());
  }
}
