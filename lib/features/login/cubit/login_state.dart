part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = Status.inital,
  });

  final Status status;

  @override
  List<Object> get props => [status];

  LoginState copyWith({
    Status? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
