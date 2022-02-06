import 'package:botcell/model/oferta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:botcell/model/grupos.dart';

class GroupDbProvider {
  static final GroupDbProvider group_db = GroupDbProvider();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await openDb();
      return _database!;
    }
  }

  Future openDb() async {
    return await openDatabase(join(await getDatabasesPath(), 'my.db'),
        version: 1,
        onOpen: (db) async {}, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE grupo(id INTEGER PRIMARY KEY  autoincrement, name TEXT, groupName text, time TEXT)");

      await db.execute(
          "CREATE TABLE oferta(id INTEGER PRIMARY KEY autoincrement, nameGroup TEXT, caption TEXT, imageName TEXT, time TEXT)");
    });
  }

  Future insertData(Grupo group) async {
    final db = await database;
    return db.insert('grupo', group.toMap());
  }

  Future insertDataOfert(Oferta oferta) async {
    final db = await database;
    return db.insert('oferta', oferta.toMap());
  }

  Future updateGrupo(Grupo group) async {
    final db = await database;

    return db
        .update('grupo', group.toMap(), where: "id = ?", whereArgs: [group.id]);
  }

  Future updateOferta(Oferta oferta) async {
    final db = await database;
    return db.update(
      'oferta',
      oferta.toMap(),
      where: "id=?",
      whereArgs: [oferta.id]
    );
  }

  Future<int> deleteGrupo(int id) async {
    final db = await database;
    return db.delete('grupo', where: "id = ?", whereArgs: [id]);
  }

  Future<int> deleteOferta(int id) async {
    final db = await database;
    return db.delete('oferta', where: "id = ?", whereArgs: [id]);
  }

  Future<List<Grupo>> getGrupo() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('grupo');
    List<Grupo> list =
        maps.isNotEmpty ? maps.map((note) => Grupo.fromMap(note)).toList() : [];
    return list;
  }

  Future<List<Oferta>> getOfertas() async {
    final db = await database;
    final List<Map<String, dynamic>> oferts = await db.query("oferta");
    List<Oferta> oferta = oferts.isNotEmpty
        ? oferts.map((note) => Oferta.fromMap(note)).toList()
        : [];
    return oferta;
  }
}
