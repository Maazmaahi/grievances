import 'dart:typed_data';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  // Get the database instance
  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'grievance.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Create tables
  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        age INTEGER,
        gender TEXT,
        address TEXT,
        profile_picture BLOB,
        mobile_number TEXT,
        email TEXT,
        role TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE grievances(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        description TEXT,
        priority TEXT,
        status TEXT,
        image BLOB,
        document BLOB,
        userId INTEGER,
        FOREIGN KEY (userId) REFERENCES users(id)
      )
    ''');
  }

  // Insert user data
  Future<int> insertUser({
    required String username,
    required int age,
    required String gender,
    required String address,
    required File profilePicture,
    required String mobileNumber,
    required String email,
    required String role,  // Added role to the user
  }) async {
    final db = await database;

    List<int> profilePictureBytes = await profilePicture.readAsBytes();

    Map<String, dynamic> userData = {
      'username': username,
      'age': age,
      'gender': gender,
      'address': address,
      'profile_picture': Uint8List.fromList(profilePictureBytes),
      'mobile_number': mobileNumber,
      'email': email,
      'role': role,  // Store role value (e.g., 'user' or 'admin')
    };

    return await db.insert('users', userData);
  }

  // Get user data
  Future<Map<String, dynamic>?> getUser(int userId) async {
    final db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // Get user by role
  Future<List<Map<String, dynamic>>> getUsersByRole(String role) async {
    final db = await database;

    return await db.query(
      'users',
      where: 'role = ?',
      whereArgs: [role],
    );
  }

  // Insert grievance data with image (BLOB) and document (BLOB)
  Future<int> insertGrievanceWithImage({
    required String type,
    required String description,
    required String priority,
    required String status,
    required File imageFile,
    required File? documentFile,
    required int userId,
  }) async {
    final db = await database;

    List<int> imageBytes = await imageFile.readAsBytes();
    List<int>? documentBytes;

    if (documentFile != null) {
      documentBytes = await documentFile.readAsBytes();
    }

    Map<String, dynamic> grievanceData = {
      'type': type,
      'description': description,
      'priority': priority,
      'status': status,
      'image': Uint8List.fromList(imageBytes),
      'document': documentBytes != null ? Uint8List.fromList(documentBytes) : null,
      'userId': userId,
    };

    return await db.insert('grievances', grievanceData);
  }

  // Retrieve grievance by ID and convert image BLOB to Image
  Future<Map<String, dynamic>?> getGrievance(int grievanceId) async {
    final db = await database;

    List<Map<String, dynamic>> grievances = await db.query(
      'grievances',
      where: 'id = ?',
      whereArgs: [grievanceId],
    );

    if (grievances.isNotEmpty) {
      return grievances.first;
    }
    return null;
  }

  // Update grievance status
  Future<int> updateGrievanceStatus(int grievanceId, String status) async {
    final db = await database;

    return await db.update(
      'grievances',
      {'status': status},
      where: 'id = ?',
      whereArgs: [grievanceId],
    );
  }

  // Get all grievances for a user
  Future<List<Map<String, dynamic>>> getGrievancesByUserId(int userId) async {
    final db = await database;

    return await db.query(
      'grievances',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }

  // Get user by mobile number
  Future<Map<String, dynamic>?> getUserByMobile(String mobileNumber) async {
    final db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'mobile_number = ?',
      whereArgs: [mobileNumber],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

}
