

import 'package:get/get.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class LoginController extends GetxController{
  late User user;
  UserService userService = UserService();
  loginUser(String email) async {
    User user =  await userService.getUserByEmail(email);
    if (user.userId == 'null') {
      return 'user not found';
    }
    return user;
  }
}