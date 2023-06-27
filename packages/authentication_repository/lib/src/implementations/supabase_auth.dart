import 'package:authentication_repository/authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const googleAuthRedirectUrl =
    'https://jogksugnovtvlaklkwjy.supabase.co/auth/v1/callback';

class SupabaseAuth implements AuthenticationContract {
  SupabaseAuth({required this.client});

  final SupabaseClient client;

  @override
  Future<void> loginWithGoogle() async {
    await client.auth.signInWithOAuth(
      Provider.google,
      redirectTo: '',
    );
  }

  @override
  Future<void> logout() async {
    await client.auth.signOut();
  }
}
