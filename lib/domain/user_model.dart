class UserModel {
  final String username;
  final String password;
  final String? email;
  final String? image;
  final int id;

  const UserModel({
    this.image,
    required this.password,
    required this.username,
    required this.id,
    this.email,
  });

  static const empty = UserModel(password: "", username: "", id: -1);
}
