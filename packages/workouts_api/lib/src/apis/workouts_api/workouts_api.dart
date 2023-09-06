import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'package:workouts_api/src/models/models.dart';

class WorkoutsApi {
  WorkoutsApi({
    required this.authRepository,
    firebase_firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? firebase_firestore.FirebaseFirestore.instance;

  final firebase_firestore.FirebaseFirestore _firebaseFirestore;
  final AuthenticationContract authRepository;

  Future<void> saveWorkout(Workout workout) async {
    final user = authRepository.currentUser;

    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .collection('workouts')
        .add(workout.toJson());
  }

  Future<List<Workout>> getWorkouts() async {
    final user = authRepository.currentUser;
    final snapshot = await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .collection('workouts')
        .get();

    return snapshot.docs.map(
      (doc) {
        return Workout.fromJson(
          doc.data(),
        )..docId = doc.id;
      },
    ).toList();
  }

  Future<void> updateWorkout(Workout workout) async {
    final user = authRepository.currentUser;

    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .collection('workouts')
        .doc(workout.docId)
        .set(
          workout.toJson(),
        );
  }

  Future<void> deleteWorkout(String docId) async {
    final user = authRepository.currentUser;
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .collection('workouts')
        .doc(docId)
        .delete();
  }
}
