// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oh_my_gym_app/login/login.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  late LoginCubit loginCubit;

  setUp(() {
    loginCubit = MockLoginCubit();

    when(() => loginCubit.state).thenReturn(LoginState());
  });

  group('LoginBody', () {
    testWidgets('renders login button', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: loginCubit,
          child: MaterialApp(home: LoginBody()),
        ),
      );

      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
