abstract class AuthenticationContract {
  Future<void> loginWithGoogle();
  Future<void> logout();
}
