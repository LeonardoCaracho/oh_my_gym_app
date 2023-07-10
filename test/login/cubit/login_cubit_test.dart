// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/features/login/login.dart';

class MockAuthenticationContract extends Mock
    implements AuthenticationContract {}

void main() {
  late AuthenticationContract authRepository;
  late LoginCubit loginCubit;

  setUp(() {
    authRepository = MockAuthenticationContract();
    loginCubit = LoginCubit(authRepository: authRepository);
  });

  group('LoginCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          LoginCubit(
            authRepository: authRepository,
          ),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      expect(loginCubit.state.status, Status.inital);
    });
  });
}
