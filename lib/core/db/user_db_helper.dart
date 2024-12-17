import 'package:grievances/data/models/user_model.dart';

import 'db_helper.dart';

class UserDBHelper {
  static const table = 'users';

  Future<int> insertUser(User user) async {
    final db = await DBHelper.instance.database;
    return await db.insert(table, user.toMap());
  }

  Future<User?> getUserByMobileNumber(String mobileNumber) async {
    final db = await DBHelper.instance.database;
    var res = await db.query(table,
        where: 'mobileNumber = ?', whereArgs: [mobileNumber]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await DBHelper.instance.database;
    var res = await db.query(table);
    return res.isNotEmpty
        ? res.map((item) => User.fromMap(item)).toList()
        : [];
  }
}
