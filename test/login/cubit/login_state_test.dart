// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/login/login.dart';

void main() {
  group('LoginState', () {
    test('supports value equality', () {
      expect(
        LoginState(),
        equals(
          const LoginState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const LoginState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const loginState = LoginState();
          expect(
            loginState.copyWith(),
            equals(loginState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const loginState = LoginState();
          final otherLoginState = LoginState(
            status: Status.loading,
          );
          expect(loginState, isNot(equals(otherLoginState)));

          expect(
            loginState.copyWith(
              status: otherLoginState.status,
            ),
            equals(otherLoginState),
          );
        },
      );
    });
  });
}
