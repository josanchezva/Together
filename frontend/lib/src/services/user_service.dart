import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/src/dto/create_user_dto.dart';
import 'package:frontend/src/dto/update_user_dto.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user');
var headers = {'Content-Type': 'application/json'};

class UserService {
  UserService();

  final User _nullUser = User(
    email: 'null',
    userId: 'null',
    password: 'null',
    firstName: 'null',
    surname: 'null',
    secondName: 'null',
    contactPhone: 'null',
    role: 'null',
    creationDate: 'null',
  );
  late User user;

  Future<User> createUser(
      String email, String username, String password) async {
    CreateUserDto userDto = CreateUserDto(
        contactPhone: '1234567890',
        email: email,
        firstName: username,
        password: password,
        secondName: username,
        surname: username);
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user/create');
    var res = await http.post(url,
        headers: headers, body: createUserDtoToJson(userDto));
    if (res.statusCode == 200) {
      user = User.fromJson(jsonDecode(res.body));
    } else {
      user = _nullUser;
    }
    return user;
  }

  Future<User> getUserByEmail(String email) async {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user/get?email=$email');
    var res = await http.get(url, headers: headers);
    if (res.statusCode == 200 && res.body != '') {
      user = User.fromJson(jsonDecode(res.body));
    } else {
      user = _nullUser;
    }
    return user;
  }

  getUserById(String id) async {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user/get/$id');
    var res = await http.get(url, headers: headers);
    if (res.statusCode == 200 && res.body != '') {
      user = User.fromJson(jsonDecode(res.body));
    } else {
      user = _nullUser;
    }
    return user;
  }

  updateUserById(String id, UpdateUserDto userDto) async {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user/$id');
    var res = await http.put(url,
        headers: headers, body: updateUserDtoToJson(userDto));
    if (res.statusCode == 200 && res.body != '') {
      user = User.fromJson(jsonDecode(res.body));
    } else {
      user = _nullUser;
    }
    return user;
  }

  deleteUserById(String id) async {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/user/$id');
    var res = await http.delete(url, headers: headers);
    if (res.statusCode == 200 && res.body != '') {
      user = User.fromJson(jsonDecode(res.body));
    } else {
      user = _nullUser;
    }
    return user;
  }
}
