import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const _databaseName = "app_database.db";
  static const _databaseVersion = 1;

  static late Database _database;

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    var documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            mobileNumber TEXT NOT NULL,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            profilePicture BLOB,
            role TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE grievances (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            status TEXT,
            createdDate TEXT,
            updatedDate TEXT,
            image BLOB,
            pdf BLOB
          )
        ''');
      },
    );
  }
}
