import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'local.db');
    Database mydb = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return mydb;
  }

  void _onUpgrade(Database db, int oldversion, int newversion) async {
    if (oldversion < 2) {
      await db.execute('ALTER TABLE notes ADD COLUMN date TEXT');
    }
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "tasks" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "task" TEXT
      
    )
''');
    print('the database and table had been created');
  }

  Future<void> insertTask(String task) async {
    final db = await this.db;
    await db!.insert('tasks', {'task': task});
  }

  Future<void> updateNote(int id, String task) async {
    final db = await this.db;
    await db!.update(
      'tasks',
      {'task': task},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> gettask() async {
    final db = await this.db;
    return db!.query('tasks');
  }

  Future<void> clearTable() async {
    final db = await this.db;
    await db!.delete('notes');
    print('the table have been cleaned');
  }
}
