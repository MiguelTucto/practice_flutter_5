import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  final int version = 1;
  Database? db;

  Future<Database> openDb() async {
    if (db == null)
    {
      db = await openDatabase(join(await getDatabasesPath(),
          'shopp.db'),
          onCreate: (database, version) {
            database.execute(
                'CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
            database.execute(
                'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, '
                    'name TEXT, quantity TEXT, note TEXT, FOREIGN KEY(idList) REFERENCES lists(id))');
          }, version: version
      );
    }
    return db!;
  }

  Future testDb() async {
    db = await openDb();
    
    await db!.execute('INSERT INTO lists(name, priority) VALUES("Vitaminas", 1)');
    await db!.execute('INSERT INTO items VALUES(null, 1, "Vitamina B6", "10 pastillas", "Marca Bayer")');

    List list = await db!.rawQuery("SELECT * FROM lists");
    List item = await db!.rawQuery("SELECT * FROM items");

    print(list[0]);
    print(item[0]);
  }
}