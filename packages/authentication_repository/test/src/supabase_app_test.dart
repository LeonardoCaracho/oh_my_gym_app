// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:test/test.dart';

class MockSupabaseClient extends Mock implements supabase.SupabaseClient {}

void main() {
  late supabase.SupabaseClient client;

  setUp(() {
    client = MockSupabaseClient();
  });

  group('Authentication', () {
    test('can be instantiated', () {
      expect(
        SupabaseAuthRepository(
          client: client,
        ),
        isNotNull,
      );
    });
  });
}
