
abstract class AuthenticationRepository{

  //function used to register a user
  Future<bool> registerUser({required String userName , required password});
}