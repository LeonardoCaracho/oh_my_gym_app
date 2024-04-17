import 'package:get_it/get_it.dart';
import 'package:history_repository/history_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutRepositoryMock extends Mock implements WorkoutRepository {}

class HistoryRepositoryMock extends Mock implements HistoryRepository {}

GetIt locator = GetIt.instance;

Future<void> initLocatorTesting() async {
  locator
    ..registerSingletonAsync<WorkoutRepository>(
      () async => WorkoutRepositoryMock(),
    )
    ..registerSingletonAsync<HistoryRepository>(
      () async => HistoryRepositoryMock(),
    );

  await locator.allReady();
}

Future<void> clearLocatorTesting() async {
  await locator.reset();
}
