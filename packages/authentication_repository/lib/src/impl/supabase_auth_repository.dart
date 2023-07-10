import 'package:authentication_repository/authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

const googleAuthRedirectUrl = 'io.supabase.ohmygymapp://login-callback/';

class SupabaseAuthRepository implements AuthenticationContract {
  SupabaseAuthRepository({required this.client});

  final supabase.SupabaseClient client;

  @override
  Future<void> loginWithGoogle() async {
    await client.auth.signInWithOAuth(
      supabase.Provider.google,
      // redirectTo: googleAuthRedirectUrl,
    );
  }

  @override
  Future<void> logout() async {
    await client.auth.signOut();
  }

  @override
  Stream<User> get user {
    return client.auth.onAuthStateChange.map((supabaseUser) {
      final user = supabaseUser.session?.user;

      if (user != null) {
        return user.toUser;
      }

      //save user in cache

      return User.empty;
    });
  }

  @override
  User get currentUser {
    return User.empty;
  }
}

extension on supabase.User {
  /// Maps a [supabase.User] into a [User].
  User get toUser {
    return User(
      id: id,
      email: email,
      name: '',
    );
  }
}
