import 'package:flutter/foundation.dart';
import 'package:real_firstprogram/database/manageDB.dart';
import 'package:real_firstprogram/model/chat_type.dart';

class TranChatProvider with ChangeNotifier {
  List<Chatdata> _ListChatProvider = [];

  manageDB selectDB(String dbname) {
    manageDB db = manageDB("Chat_main_{$dbname}");
    return db;
  }

  //getter
  List<Chatdata> data() => _ListChatProvider;

  //updatelist
  Future updatelist(String dbname) async {
    var snapshot = await selectDB(dbname).loaddata();
    print("dbname is ${dbname}");
    List<Chatdata> listprepare = [];
    for (var data in snapshot) {
      listprepare.add(
        Chatdata(
          text: data["text"].toString(),
          name: data["name"].toString(),
          IsMe: int.parse(data["IsMe"].toString()),
          icon_id: int.parse(data["icon_id"].toString()),
          date: DateTime.parse(data["date"].toString()),
          id: data.key,
        ),
      );
    }
    _ListChatProvider = listprepare;
    notifyListeners();
  }

  Future<void> addTo({required Chatdata chat, required String dbname}) async {
    await selectDB(dbname).addtoDB(chat.Tomap());
    await updatelist(dbname);
  }

  Future<void> remove({required int id, required String dbname}) async {
    await selectDB(dbname).remove(id);
    await updatelist(dbname);
  }
}
