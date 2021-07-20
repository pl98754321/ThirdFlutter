import 'package:flutter/foundation.dart';
import 'package:real_firstprogram/database/manageDB.dart';
import 'package:real_firstprogram/provider/card_type.dart';

class trancardProvider with ChangeNotifier {
  List<card> _listcardprovider = [];
  manageDB db = manageDB("cardmain");

  //getter
  List<card> data() => _listcardprovider;

  //updatelist
  Future updatelist() async {
    var snapshot = await db.loaddata();
    print(snapshot);
    List<card> listprepare = [];
    for (var data in snapshot) {
      listprepare.add(
        card(
          title: data["title"].toString(),
          subtitle: data["subtitle"].toString(),
          icon_id: int.parse(data["icon_id"].toString()),
          date: DateTime.parse(data["date"].toString()),
          id: data.key,
        ),
      );
      print("Data is  ${data["title"].toString()}");
    }
    _listcardprovider = listprepare;
    notifyListeners();
  }

  Future<void> addTo(card card) async {
    await db.addtoDB(card.Tomap());
    await updatelist();
  }

  Future<void> remove(int id) async {
    await db.remove(id);
    await updatelist();
  }
}
