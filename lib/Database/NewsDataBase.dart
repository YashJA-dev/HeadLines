import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Model/News.dart';

class ArticalsDataBase {
  static final ArticalsDataBase instance = ArticalsDataBase._init();
  static Database? _database;

  ArticalsDataBase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("News.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
CREATE TABLE $tableName (
  ${ArticalField.id} $idType,
  ${ArticalField.discription} $textType,
  ${ArticalField.publishedAt} $textType,
  ${ArticalField.source} $textType,
  ${ArticalField.title} $textType,
  ${ArticalField.urlToImage} $textType
)
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<Artical> create(Artical artical) async {
    final db = await instance.database;
    await db.insert(tableName, artical.toJson());
    return artical;
  }

  Future<List<Map<String, Object?>>> readAllArticals() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result;
  }
  deleteAll() async {
    Database db = await instance.database;
    return await db.rawDelete("Delete from $tableName");
  }
}
