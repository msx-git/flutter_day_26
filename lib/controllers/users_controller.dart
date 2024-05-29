import 'package:flutter_day_26/services/users_http_service.dart';

import '../models/user.dart';

class UsersController {
  final usersHttpService = UsersHttpService();

  Future<List<User>> getUsers() async {
    return await usersHttpService.fetchUsers();
  }
}
