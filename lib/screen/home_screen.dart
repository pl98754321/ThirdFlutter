import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/Route/CardPopupRout.dart';
import 'package:real_firstprogram/provider/caed_provider.dart';
import 'package:real_firstprogram/provider/card_type.dart';
import 'package:real_firstprogram/screen/Asset_/PopupList_screen.dart';
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
            child: _Button(),
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
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Hero(
        transitionOnUserGestures: true,
        tag: "HeroTag${this.eachcard.id}",
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(CardPopupRoute(
              builder: (BuildContext context) {
                return Popuplist(this.trancardPro, this.eachcard);
              },
            ));
          },
          child: Material(
            color: bg,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(this.eachcard.title)),
          ),
        ),
      ),
    );
  }
}

///Floating button for homepage

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CardPopupRoute(
            builder: (BuildContext context) {
              return Formscreen();
            },
          ),
        );
      },
      child: Hero(
        tag: "formherotag2",
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Material(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
