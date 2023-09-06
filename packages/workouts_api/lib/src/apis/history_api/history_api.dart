import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'package:workouts_api/src/models/models.dart';

class HistoryApi {
  HistoryApi({
    required this.authRepository,
    firebase_firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? firebase_firestore.FirebaseFirestore.instance;

  final firebase_firestore.FirebaseFirestore _firebaseFirestore;
  final AuthenticationContract authRepository;

  Future<void> saveRecord(WorkoutHistory record) async {
    final user = authRepository.currentUser;

    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .collection(WorkoutHistory.collectionName)
        .add(record.toJson());
  }

  Future<List<WorkoutHistory>> getRecords() async {
    final user = authRepository.currentUser;
    final snapshot = await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .collection(WorkoutHistory.collectionName)
        .get();

    return snapshot.docs.map(
      (doc) {
        return WorkoutHistory.fromJson(
          doc.data(),
        )..docId = doc.id;
      },
    ).toList();
  }

  Future<void> deleteRecord(String docId) async {
    final user = authRepository.currentUser;
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .collection(WorkoutHistory.collectionName)
        .doc(docId)
        .delete();
  }
}
