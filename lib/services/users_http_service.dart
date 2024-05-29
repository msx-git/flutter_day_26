import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UsersHttpService {
  Future<List<User>> fetchUsers() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final List<User> loadedUsers = [];
    if (data != null) {
      for (var user in data) {
        loadedUsers.add(User.fromJson(user));
      }
    }
    return loadedUsers;
  }
}
