
abstract class AuthenticationRepository{

  Future<bool> registerUser({required String userName , required password});
}