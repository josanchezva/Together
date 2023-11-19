import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/src/dto/create_user_dto.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user');
class UserService {
  UserService();

  final User _nullUser = User(
    email: 'null',
    id: 'null',
    name: 'null',
  );
  late User user;

  Future<User> createUser(String email, String username, String password) async {
    CreateUserDto userDto = CreateUserDto(email: email, name: username, password: password);

    var res = await http.post(url,body: userDto);
    if (res.statusCode == 200) {
      user = User.fromJson(jsonDecode(res.body));
    } else {
      user = _nullUser;
    }
    return user;
  }

  getUserByEmail(String text) {}
}
