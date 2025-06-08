class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? password;
  final String? role;
  final List<String>? token;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.password,
    this.role,
    this.token,
    this.createdAt,
    this.updatedAt,
  });
}
