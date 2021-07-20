import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class manageDB {
  String databasename;
  manageDB(this.databasename);

  StoreRef<int, Map<String, Object?>> _store() =>
      intMapStoreFactory.store("main");

  Future<Database> _openDB() async {
    Directory locateApp = await getApplicationDocumentsDirectory();
    String locateDB = join(locateApp.path, databasename);
    Database db = await databaseFactoryIo.openDatabase(locateDB);
    return db;
  }

  Future<void> addtoDB(Map<String, Object?> map) async {
    Database db = await _openDB();
    var store = _store();
    store.add(db, map);
    db.close();
  }

  Future<void> remove(int id) async {
    Finder finder = Finder(filter: Filter.byKey(id));
    Database db = await _openDB();
    var store = _store();
    store.delete(db, finder: finder);
  }

  Future<List<RecordSnapshot<int, Map<String, Object?>>>> loaddata() async {
    Database db = await _openDB();
    var store = _store();
    List<RecordSnapshot<int, Map<String, Object?>>> snapshot =
        await store.find(db);
    return snapshot;
  }
}
