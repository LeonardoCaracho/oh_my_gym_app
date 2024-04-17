import 'package:authentication_repository/authentication_repository.dart';

abstract class AuthenticationRepository {
  Future<void> loginWithGoogle();
  Future<void> logout();
  Stream<User> get user;
  User get currentUser;
}
