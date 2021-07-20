import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/provider/card_provider.dart';
import 'package:real_firstprogram/provider/card_type.dart';
import 'package:real_firstprogram/screen/chat_screen.dart';
import 'form_screen.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UntilNow"),
      ),
      body: Stack(
        children: [
          bodyhome(),
          Align(
            alignment: Alignment.bottomRight,
            child: Button(),
          )
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////
/////////////////////////////////////////////////
class bodyhome extends StatefulWidget {
  const bodyhome({Key? key}) : super(key: key);

  @override
  _bodyhomeState createState() => _bodyhomeState();
}

class _bodyhomeState extends State<bodyhome> {
  @override
  void initState() {
    Provider.of<trancardProvider>(context, listen: false).updatelist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, trancardProvider trancardPro, Widget? child) {
        return Card(
          elevation: 5,
          child: ListView.builder(
              itemCount: trancardPro.data().length,
              itemBuilder: (context, int index) {
                card eachcard = trancardPro.data()[index];
                return _ListEachcard(trancardPro, eachcard);
              }),
        );
      },
    );
  }
}

/// ListTile For Eachcard
///
class _ListEachcard extends StatelessWidget {
  card eachcard;
  trancardProvider trancardPro;
  _ListEachcard(this.trancardPro, this.eachcard);

  Color bg = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Chat_structure(trancardPro, eachcard);
            },
          ),
        );
      },
      title: Text(eachcard.title),
      subtitle: Text(eachcard.subtitle),
      leading: CircleAvatar(
        child: Text(eachcard.icon_id.toString()),
      ),
    );
  }
}
