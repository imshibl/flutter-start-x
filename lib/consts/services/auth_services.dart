String authServices = '''
import '../models/auth_model.dart';

abstract class AuthServices {

Future<AuthModel> login(String email, String password);
  
}

class AuthServicesImpl implements AuthServices {

  @override
  Future<AuthModel> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
}

''';
