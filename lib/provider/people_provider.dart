import 'package:flutter/foundation.dart';
import 'package:real_firstprogram/database/manageDB.dart';
import 'package:real_firstprogram/provider/people_type.dart';

class TranPeopleProvider with ChangeNotifier {
  List<People> _listPeopleprovider = [];
  manageDB db = manageDB("peoplemain");

  //getter
  List<People> data() => _listPeopleprovider;

  //updatelist
  Future updatelist() async {
    var snapshot = await db.loaddata();
    List<People> listprepare = [];
    for (var data in snapshot) {
      listprepare.add(
        People(
          title: data["title"].toString(),
          subtitle: data["subtitle"].toString(),
          icon_id: int.parse(data["icon_id"].toString()),
          date: DateTime.parse(data["date"].toString()),
          id: data.key,
        ),
      );
    }
    _listPeopleprovider = listprepare;
    notifyListeners();
  }

  Future<void> addTo(People people) async {
    await db.addtoDB(people.Tomap());
    await updatelist();
  }

  Future<void> remove(int id) async {
    await db.remove(id);
    await updatelist();
  }
}
