import 'package:path/path.dart';
import 'package:quize_int/students.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _databaseName = "student.db";
  static const String _tableName = "students";
  static const int _version = 1;

  static Future<Database> get database async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,username TEXT PRIMARY KEY, password TEXT, score INTEGER)',
        );
      },
      version: _version,
    );
  }

  static Future<Student?> getStudentByUsernameAndPassword(
      String username, String password) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT * FROM students WHERE username = ? AND password = ?',
      [username, password],
    );
    if (result.isEmpty) {
      return null;
    }
    final student = Student.fromJson(result.first);
    return student;
  }

  static Future<Map<String, dynamic>> getDataById(int id) async {
    final db = await database;
    final result = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      print(result.first);
      return result.first;
    } else {
      throw Exception('Data not found');
    }
  }

  Future<void> updateStudent(Student student) async {
    final db = await database;
    await db.update(
      _tableName,
      student.toJson(),
      whereArgs: [student.id],
    );
  }

  static Future<void> insertStudent(Student student) async {
    final db = await database;
    await db.insert(
      _tableName,
      student.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('Student Added');
  }

  static Future<List<Student>> getStudents() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return Student(
        username: maps[i]['username'],
        password: maps[i]['password'],
        score: maps[i]['score'],
      );
    });
  }

  // static Future<int> addStudent(Student student) async {
  //   final db = await _db();
  //   final insert = await db.insert(_tableName, student.toJson(),
  //       conflictAlgorithm: sql.ConflictAlgorithm.replace);
  //   print("Student Added");
  //   return insert;
  // }
}
