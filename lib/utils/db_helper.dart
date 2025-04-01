import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqlite/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database?> get database async {
    _database ??= await initializeDB();
    return _database;
  }

  Future<Database> initializeDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'notes.db');
    var notesDB = await openDatabase(path, version: 1, onCreate: _createDB);
    return notesDB;
  }

  void _createDB(Database db, int v) async {
    await db.execute('''
      create table note(
        id integer primary key autoincrement,
        title text,
        description text,
        priority integer,
        date text
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getNoteList() async {
    final db = await database;
    return await db!.query('note', orderBy: 'priority ASC');
  }

  Future<int> addNote(Note note) async {
    final db = await database;
    return await db!.insert('note', note.toMap());
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    return db!.update(
      'note',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db!.delete('note', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> getNotesCount() async {
    final db = await database;
    final x = await db!.rawQuery('select count(*) from note');
    return Sqflite.firstIntValue(x) ?? 0;
  }
}
