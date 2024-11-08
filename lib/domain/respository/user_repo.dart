

abstract class UserRepository{

  Future<void> saveUserLoggedStatus(bool loggedStatus);
   Future<bool?> getUserLoggedStatus(String key);
}