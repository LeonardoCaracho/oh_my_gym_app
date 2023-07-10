import 'package:authentication_repository/authentication_repository.dart';

abstract class AuthenticationContract {
  Future<void> loginWithGoogle();
  Future<void> logout();
  Stream<User> get user;
  User get currentUser;
}
