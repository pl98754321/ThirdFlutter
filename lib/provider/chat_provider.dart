import 'package:flutter/foundation.dart';
import 'package:real_firstprogram/database/manageDB.dart';
import 'package:real_firstprogram/provider/Chat_type.dart';

class ChatProvider with ChangeNotifier {
  List<Chatdata> _ListChatProvider = [
    Chatdata(
        text:
            "welcomeasdadasczxcvbdbjenbuodboundjbniojnawijedbndribnsomeojgnrdunedjoaevdndmnieanininuejeanisbijeaujbnaeibingaibnanbab",
        name: "Bot1",
        IsMe: 0,
        icon_id: 14,
        date: DateTime.now()),
    Chatdata(
        text: "asddddddddddddddddddddddddddddddddddddddads",
        name: "Bot2",
        IsMe: 1,
        icon_id: 14,
        date: DateTime.now())
  ];
  manageDB db = manageDB("Chat_main");

  //getter
  List<Chatdata> data() => _ListChatProvider;

  //updatelist
  Future updatelist() async {
    var snapshot = await db.loaddata();
    print("snapshot is $snapshot");
    List<Chatdata> listprepare = [];
    for (var data in snapshot) {
      listprepare.add(
        Chatdata(
          text: data["text"].toString(),
          name: data["name"].toString(),
          IsMe: int.parse(data["icon_id"].toString()),
          icon_id: int.parse(data["icon_id"].toString()),
          date: DateTime.parse(data["date"].toString()),
          id: data.key,
        ),
      );
    }
    _ListChatProvider = listprepare;
    _ListChatProvider.insert(
        0,
        Chatdata(
            text:
                "welcomeasdadasczxcvbdbjenbuodboundjbniojnawijedbndribnsomeojgnrdunedjoaevdndmnieanininuejeanisbijeaujbnaeibingaibnanbab",
            name: "Bot1",
            IsMe: 1,
            icon_id: 14,
            date: DateTime.now()));
    notifyListeners();
  }

  Future<void> addTo(Chatdata chat) async {
    await db.addtoDB(chat.Tomap());
    await updatelist();
  }

  Future<void> remove(int id) async {
    await db.remove(id);
    await updatelist();
  }
}
