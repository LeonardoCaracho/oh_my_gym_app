import 'package:authentication_repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<AuthenticationContract>(
    FirebaseAuthRepository(),
  );
}
