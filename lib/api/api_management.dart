import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Randomword {
  Uri url = Uri.parse("http://random-word-api.herokuapp.com/word?number=1");
  Randomword() {
    String index = Random().nextInt(100).toString();
    this.url =
        Uri.parse("http://random-word-api.herokuapp.com/word?number=" + index);
  }

  Future<String> getdata() async {
    var data = await http.get(url);
    String word = _randomwordFromJson(data.body)[0];
    print("data = ${word}");
    return word;
  }

  List<String> _randomwordFromJson(String str) =>
      List<String>.from(json.decode(str).map((x) => x));

  String _randomwordToJson(List<String> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x)));
}
