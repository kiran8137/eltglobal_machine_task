
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenServies{

final secureStorage = const FlutterSecureStorage();

Future<void> saveAccessToken(String accessToken)async{
  await secureStorage.write(key: 'accesstoken', value: accessToken);
}

Future<String?> getAccessToken(String key)async{
 var accessToken =  await secureStorage.read(key: key);
  
 return accessToken;

}

Future<void> deleteAccessToken()async{
  await secureStorage.delete(key: 'accesstoken');
}


  
}