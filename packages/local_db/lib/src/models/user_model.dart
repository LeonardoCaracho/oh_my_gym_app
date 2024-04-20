class UserModel {
  UserModel({required this.id, required this.name, required this.email});

  final String id;
  final String name;
  final String email;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
