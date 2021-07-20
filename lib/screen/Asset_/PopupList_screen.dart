import 'package:flutter/material.dart';
import 'package:real_firstprogram/provider/caed_provider.dart';
import 'package:real_firstprogram/provider/card_type.dart';

class Popuplist extends StatelessWidget {
  card eachcard;
  trancardProvider trancardPro;
  Popuplist(this.trancardPro, this.eachcard);
  Color bg = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: "HeroTag${this.eachcard.id}",
            child: SingleChildScrollView(
              child: Material(
                color: bg,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: _popupbody(
                        trancardPro, //<-------------------------------------------------- this is main
                        eachcard)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Popup's body part
///

class _popupbody extends StatefulWidget {
  card eachcard;
  trancardProvider trancardPro;
  _popupbody(this.trancardPro, this.eachcard);

  @override
  __popupbodyState createState() => __popupbodyState();
}

class __popupbodyState extends State<_popupbody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.eachcard.title),
        TextFormField(
          decoration: InputDecoration(hintText: "Desciption"),
        )
      ],
    );
  }
}
