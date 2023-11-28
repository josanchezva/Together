

import 'package:frontend/src/models/user.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
    late final User _user;
    set user(User user) => _user = user;
}