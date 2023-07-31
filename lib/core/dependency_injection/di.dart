import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_repository/workout_repository.dart';

const userBoxName = '__user_box__';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator
    ..registerSingletonAsync<Box<Map<dynamic, dynamic>>>(() async {
      await Hive.initFlutter();
      final box = await Hive.openBox<Map<dynamic, dynamic>>(userBoxName);
      return box;
    })
    ..registerSingletonAsync<UserCacheContract>(
      () async => UserCache(userBox: locator<Box<Map<dynamic, dynamic>>>()),
      dependsOn: [Box<Map<dynamic, dynamic>>],
    )
    ..registerSingletonAsync<AuthenticationContract>(
      () async => FirebaseAuthRepository(
        cache: locator<UserCacheContract>(),
      ),
      dependsOn: [UserCacheContract],
    )
    ..registerSingletonAsync<WorkoutsContract>(
      () async => WorkoutRepository(
        authRepository: locator<AuthenticationContract>(),
      ),
      dependsOn: [AuthenticationContract],
    );

  await locator.allReady();
}
