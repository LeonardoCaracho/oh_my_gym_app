import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/login/login.dart';

class MockAppBloc extends MockCubit<AppState> implements AppBloc {}

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class MockAuthenticationContract extends Mock
    implements FirebaseAuthRepository {}

void main() {
  setUp(() {
    locator.registerSingleton<AuthenticationContract>(
      MockAuthenticationContract(),
    );
  });
}
