import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/provider/Chat_type.dart';
import 'package:real_firstprogram/provider/card_provider.dart';
import 'package:real_firstprogram/provider/card_type.dart';
import 'package:real_firstprogram/provider/chat_provider.dart';

class Chat_structure extends StatelessWidget {
  card eachcard;
  trancardProvider trancardPro;
  Chat_structure(this.trancardPro, this.eachcard);
  Color bg = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eachcard.title),
      ),
      body: Stack(children: [
        ChatBody(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
              color: Colors.white,
              child: Row(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                  ),
                ],
              )),
        )
      ]),
    );
  }
}

//////////////////////////////////////
class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, ChatProvider chatProvider, Widget? child) {
        return ListView.builder(
            itemCount: chatProvider.data().length,
            itemBuilder: (BuildContext Context, int index) {
              Chatdata eachchat = chatProvider.data()[index];
              if (eachchat.IsMe == 0) {
                return _ChatboxNOtIsme(eachchat);
              } else {
                return _ChatboxIsme(eachchat);
              }
            });
      },
    );
  }
}

//////////////////////////////////////
class _ChatboxNOtIsme extends StatelessWidget {
  Chatdata eachchat;
  _ChatboxNOtIsme(this.eachchat);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 10, 8, 10),
          child: Material(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    child:
                        CircleAvatar(child: Text(eachchat.icon_id.toString()))),
                SizedBox(width: 5),
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(height: 5),
                    Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(eachchat.text,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        )),
                  ],
                )),
                SizedBox(width: 25)
              ],
            ),
          ),
        )
      ],
    );
  }
}

//////////////////////////////////////
class _ChatboxIsme extends StatelessWidget {
  Chatdata eachchat;
  _ChatboxIsme(this.eachchat);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 16, 10),
          child: Material(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 70,
                ),
                Expanded(
                    child: Material(
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(eachchat.text,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
