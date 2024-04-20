import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:get_it/get_it.dart';
import 'package:history_repository/history_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_db/local_db.dart';
import 'package:workout_repository/workout_repository.dart';
import 'package:workouts_api/workouts_api.dart';

const userBoxName = '__user_box__';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator
    ..registerSingletonAsync<Box<Map<dynamic, dynamic>>>(() async {
      await Hive.initFlutter();
      final box = await Hive.openBox<Map<dynamic, dynamic>>(userBoxName);
      return box;
    })
    ..registerSingletonAsync<LocalDatabase>(() async {
      final db = await DatabaseProvider().database;
      return LocalDatabaseImpl(database: db!);
    })
    ..registerSingletonAsync<UserCacheContract>(
      () async => UserCache(userBox: locator<Box<Map<dynamic, dynamic>>>()),
      dependsOn: [Box<Map<dynamic, dynamic>>],
    )
    ..registerSingletonAsync<AuthenticationRepository>(
      () async => AuthenticationRepositoryImpl(
        cache: locator<UserCacheContract>(),
      ),
      dependsOn: [UserCacheContract],
    )
    ..registerSingletonAsync<WorkoutsApi>(
      () async => WorkoutsApi(
        authRepository: locator<AuthenticationRepository>(),
      ),
      dependsOn: [AuthenticationRepository],
    )
    ..registerSingletonAsync<HistoryApi>(
      () async => HistoryApi(
        authRepository: locator<AuthenticationRepository>(),
      ),
      dependsOn: [AuthenticationRepository],
    )
    ..registerSingletonAsync<WorkoutRepository>(
      () async => WorkoutRepositoryImpl(
        workoutsApi: locator<WorkoutsApi>(),
      ),
      dependsOn: [WorkoutsApi],
    )
    ..registerSingletonAsync<HistoryRepository>(
      () async => HistoryRepositoryImpl(
        locator<HistoryApi>(),
      ),
      dependsOn: [HistoryApi],
    );

  await locator.allReady();
}
