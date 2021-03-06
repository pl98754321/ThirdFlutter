import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/api/api_management.dart';
import 'package:real_firstprogram/model/chat_type.dart';
import 'package:real_firstprogram/model/people_type.dart';
import 'package:real_firstprogram/provider/chat_provider.dart';

class Input_chat extends StatefulWidget {
  People eachPeople;
  Input_chat(this.eachPeople);
  @override
  _Input_chatState createState() => _Input_chatState();
}

class _Input_chatState extends State<Input_chat> {
  TextEditingController controllerA = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 50,
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            SizedBox(width: 5),
            Expanded(
              child: Material(
                color: Colors.black.withOpacity(0.05),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      onChanged: (Str) {
                        setState(() {});
                      },
                      controller: controllerA,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "texthere",
                          hintStyle: TextStyle(color: Colors.black54)),
                    ))
                  ],
                ),
              ),
            ),
            !controllerA.text.isEmpty
                ? IconButton(
                    onPressed: () async {
                      TranChatProvider provider =
                          Provider.of<TranChatProvider>(context, listen: false);
                      provider.addTo(
                          chat: Chatdata(
                              date: DateTime.now(),
                              icon_id: 5,
                              IsMe: 1,
                              name: '',
                              text: controllerA.text),
                          dbname: widget.eachPeople.title);

                      setState(() {
                        controllerA.clear();
                      });

                      provider.addTo(
                          chat: Chatdata(
                              date: DateTime.now(),
                              icon_id: 14,
                              IsMe: 0,
                              name: '',
                              text: await Randomword().getdata()),
                          dbname: widget.eachPeople.title);
                    },
                    icon: Icon(Icons.send, color: Colors.blue))
                : IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
