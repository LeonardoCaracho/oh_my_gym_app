part of 'login_cubit.dart';

/// {@template login}
/// LoginState description
/// {@endtemplate}
class LoginState extends Equatable {
  /// {@macro login}
  const LoginState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current LoginState with property changes
  LoginState copyWith({
    String? customProperty,
  }) {
    return LoginState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template login_initial}
/// The initial state of LoginState
/// {@endtemplate}
class LoginInitial extends LoginState {
  /// {@macro login_initial}
  const LoginInitial() : super();
}
