import 'package:http/http.dart';

class randomword {
  String url = "http://random-word-api.herokuapp.com/word?number=1";
  var response=await http.get(url);
}
