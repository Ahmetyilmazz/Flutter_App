import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_sqlite/models/task.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _tasksTableName = "tasks"; // Görevler tablosu adı
  final String _tasksIdColumnName = "id"; // Görev ID sütunu
  final String _tasksContentColumnName = "content"; // Görev içeriği sütunu
  final String _tasksStatusColumnName = "status"; // Görev durumu sütunu

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
      CREATE TABLE $_tasksTableName (
        $_tasksIdColumnName INTEGER PRIMARY KEY,
        $_tasksContentColumnName TEXT NOT NULL,
        $_tasksStatusColumnName INTEGER NOT NULL
      )
      ''');
      },
    );
    return database;
  }

  void addTask(
    String content,
  ) async {
    final db = await database;
    await db.insert(_tasksTableName, {
      _tasksContentColumnName: content,
      _tasksStatusColumnName: 0,
    });
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final data = await db.query(_tasksTableName);
    List<Task> tasks = data
        .map(
          (e) => Task(
            id: e["id"] as int, // Görev ID
            status: e["status"] as int, //Görev Durumu
            content: e["content"] as String, // Görev İçeriği
          ),
        )
        .toList();
    return tasks;
  }

  void updateTaskStatus(int id, int status) async {
    final db = await database;
    await db.update(
      _tasksTableName,
      {
        _tasksStatusColumnName: status, // Görev durumu
      },
      where: 'id = ?',
      whereArgs: [
        id, // Görev ID
      ],
    );
  }

  void deleteTask(int id) async {
    final db = await database;
    await db.delete(
      _tasksTableName,
      where: 'id = ?',
      whereArgs: [
        id, // Görev ID
      ],
    );
  }
}
