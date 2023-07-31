// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/core/core.dart';
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

    group('loginWithGoogle', () {
      blocTest<LoginCubit, LoginState>(
        'should log in succesfully',
        build: () {
          when(() => authRepository.loginWithGoogle()).thenAnswer(
            (_) => Future.value(),
          );

          return loginCubit;
        },
        act: (bloc) => bloc.loginWithGoogle(),
        expect: () => [
          LoginState(status: Status.loading),
          LoginState(status: Status.success),
        ],
      );

      blocTest<LoginCubit, LoginState>(
        'should not login successfuly',
        build: () {
          when(() => authRepository.loginWithGoogle()).thenThrow(Error());

          return loginCubit;
        },
        act: (bloc) => bloc.loginWithGoogle(),
        expect: () => [
          LoginState(status: Status.loading),
          LoginState(status: Status.failure),
        ],
      );
    });
  });
}
