import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_db/local_db.dart';
import 'package:workout_repository/workout_repository.dart';
import 'package:workouts_api/workouts_api.dart';

const userBoxName = '__user_box__';
const stringBoxName = '__string_box__';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator
    ..registerSingletonAsync<Box<String>>(() async {
      await Hive.initFlutter();
      final box = await Hive.openBox<String>(stringBoxName);
      return box;
    })
    ..registerSingletonAsync<Box<Map<dynamic, dynamic>>>(() async {
      await Hive.initFlutter();
      final box = await Hive.openBox<Map<dynamic, dynamic>>(userBoxName);
      return box;
    })
    ..registerSingletonAsync<LocalDatabase>(() async {
      final db = await DatabaseProvider().database;
      return LocalDatabaseImpl(database: db!);
    })
    ..registerSingletonAsync<Cache>(
      () async => CacheImpl(
        userBox: locator<Box<Map<dynamic, dynamic>>>(),
        box: locator<Box<String>>(),
      ),
      dependsOn: [
        Box<Map<dynamic, dynamic>>,
        Box<String>,
      ],
    )
    ..registerSingletonAsync<AuthenticationRepository>(
      () async => AuthenticationRepositoryImpl(
        cache: locator<Cache>(),
        localDatabase: locator<LocalDatabase>(),
      ),
      dependsOn: [Cache, LocalDatabase],
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
        localDatabase: locator<LocalDatabase>(),
        cache: locator<Cache>(),
      ),
      dependsOn: [WorkoutsApi, Cache, LocalDatabase],
    )
    ..registerSingletonAsync<HistoryRepository>(
      () async => HistoryRepositoryImpl(
        cache: locator<Cache>(),
        localDatabase: locator<LocalDatabase>(),
      ),
      dependsOn: [Cache, LocalDatabase],
    )
    ..registerSingletonAsync<ExercisesRepository>(
      () async => ExerciseRepositoryImpl(
        cache: locator<Cache>(),
        localDatabase: locator<LocalDatabase>(),
      ),
      dependsOn: [Cache, LocalDatabase],
    );

  await locator.allReady();
}
