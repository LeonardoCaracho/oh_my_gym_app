import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oh_my_gym_app/core/core.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepository,
  }) : super(const LoginState());

  final AuthenticationContract authRepository;

  FutureOr<void> loginWithGoogle() async {
    try {
      emit(state.copyWith(status: Status.loading));

      await authRepository.loginWithGoogle();

      emit(state.copyWith(status: Status.success));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
