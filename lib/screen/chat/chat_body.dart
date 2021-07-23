import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/provider/Chat_type.dart';
import 'package:real_firstprogram/provider/chat_provider.dart';
import 'package:real_firstprogram/provider/people_type.dart';

class ChatBody extends StatefulWidget {
  People eachPeople;
  ChatBody(this.eachPeople);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, TranChatProvider chatProvider, Widget? child) {
        return ListView.builder(
          itemCount: chatProvider.data().length,
          itemBuilder: (BuildContext Context, int index) {
            Chatdata eachchat = chatProvider.data()[index];
            if (eachchat.IsMe == 0) {
              return _ChatboxNOtIsme(
                eachPeople: widget.eachPeople,
                eachchat: eachchat,
              );
            } else {
              return _ChatboxIsme(
                eachPeople: widget.eachPeople,
                eachchat: eachchat,
              );
            }
          },
        );
      },
    );
  }
}

//////////////////////////////////////
class _ChatboxNOtIsme extends StatelessWidget {
  Chatdata eachchat;
  People eachPeople;
  _ChatboxNOtIsme({required this.eachchat, required this.eachPeople});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
      child: GestureDetector(
        onLongPress: () {
          Provider.of<TranChatProvider>(context, listen: false)
              .remove(dbname: eachPeople.title, id: eachchat.id);
        },
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          eachchat.text,
                          style: TextStyle(
                              color: Colors.black, fontSize: textsize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 50)
            ],
          ),
        ),
      ),
    );
  }
}

double textsize = 20;

//////////////////////////////////////
class _ChatboxIsme extends StatelessWidget {
  Chatdata eachchat;
  People eachPeople;
  _ChatboxIsme({required this.eachchat, required this.eachPeople});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
      child: GestureDetector(
        onLongPress: () {
          Provider.of<TranChatProvider>(context, listen: false)
              .remove(dbname: eachPeople.title, id: eachchat.id);
        },
        child: Material(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 70,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(eachchat.text,
                            style: TextStyle(
                                color: Colors.black, fontSize: textsize)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
