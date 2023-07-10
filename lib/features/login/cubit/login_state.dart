part of 'login_cubit.dart';

extension StatusX on Status {
  bool get isInital => this == Status.inital;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
}

enum Status {
  inital,
  loading,
  success,
  failure,
}

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
