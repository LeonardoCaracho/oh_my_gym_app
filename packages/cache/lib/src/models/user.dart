import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User {
  const User({
    required this.id,
    this.email,
    this.name,
  });

  final String? email;

  final String id;

  final String? name;
}
