import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/provider/people_provider.dart';
import 'package:real_firstprogram/provider/people_type.dart';
import 'package:real_firstprogram/provider/chat_provider.dart';
import 'package:real_firstprogram/screen/chat/Chat_structure.dart';
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
    Provider.of<TranPeopleProvider>(context, listen: false).updatelist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, TranPeopleProvider tranPeoplePro,
          Widget? child) {
        return Card(
          elevation: 5,
          child: ListView.builder(
              itemCount: tranPeoplePro.data().length,
              itemBuilder: (context, int index) {
                People eachPeople = tranPeoplePro.data()[index];
                return _ListEachPeople(tranPeoplePro, eachPeople);
              }),
        );
      },
    );
  }
}

/// ListTile For EachPeople
///
class _ListEachPeople extends StatelessWidget {
  People eachPeople;
  TranPeopleProvider tranPeoplePro;
  _ListEachPeople(this.tranPeoplePro, this.eachPeople);

  Color bg = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Provider.of<TranChatProvider>(context, listen: false)
            .updatelist(eachPeople.title);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Chat_structure(tranPeoplePro, eachPeople);
            },
          ),
        );
      },
      title: Text(eachPeople.title),
      subtitle: Text(eachPeople.subtitle),
      leading: CircleAvatar(
        child: Text(eachPeople.icon_id.toString()),
      ),
    );
  }
}
