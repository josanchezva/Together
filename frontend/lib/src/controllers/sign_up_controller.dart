import 'package:frontend/src/models/user.dart';
import 'package:frontend/src/services/user_service.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final _userService = UserService();
  createUser(String email, String name, String password) async {
    User user = await _userService.createUser(email, name, password);
    if (user.id == 'null') {
      return 'Error al crear usuario';
    }
    return user;
  }
}
