import 'package:grievances/data/models/grievance_model.dart';

import 'db_helper.dart';

class GrievanceDBHelper {
  static const table = 'grievances';

  Future<int> insertGrievance(Grievance grievance) async {
    final db = await DBHelper.instance.database;
    return await db.insert(table, grievance.toMap());
  }

  Future<List<Grievance>> getAllGrievances() async {
    final db = await DBHelper.instance.database;
    var res = await db.query(table);
    return res.isNotEmpty
        ? res.map((item) => Grievance.fromMap(item)).toList()
        : [];
  }

  Future<Grievance?> getGrievanceById(int id) async {
    final db = await DBHelper.instance.database;
    var res = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Grievance.fromMap(res.first) : null;
  }
}
