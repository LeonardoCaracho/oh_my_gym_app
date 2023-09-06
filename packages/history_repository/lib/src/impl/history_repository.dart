import 'package:history_repository/history_repository.dart';
import 'package:workouts_api/workouts_api.dart';

class HistoryRepository extends HistoryContract {
  HistoryRepository(this.historyApi);

  final HistoryApi historyApi;

  @override
  Future<void> deleteRecord(String docId) async {
    await historyApi.deleteRecord(docId);
  }

  @override
  Future<List<WorkoutHistory>> getRecords() async {
    return historyApi.getRecords();
  }

  @override
  Future<void> saveRecord(WorkoutHistory record) async {
    await historyApi.saveRecord(record);
  }
}
