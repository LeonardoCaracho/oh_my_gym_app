import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutsContractMock extends Mock implements WorkoutsContract {}

GetIt locator = GetIt.instance;

Future<void> initLocatorTesting() async {
  locator.registerSingletonAsync<WorkoutsContract>(
    () async => WorkoutsContractMock(),
  );

  await locator.allReady();
}

Future<void> clearLocatorTesting() async {
  await locator.reset();
}
