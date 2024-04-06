abstract class AuthRepo {

  Future<bool> signIn({
    required String name,
    required String email,
    required String pass,
  });

  Future<String?> logIn({
    required String username,
    required String password,
  });

  Future<void> logOut();
}
