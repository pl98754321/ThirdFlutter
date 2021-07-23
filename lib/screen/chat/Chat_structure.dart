import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/provider/chat_provider.dart';
import 'package:real_firstprogram/provider/people_provider.dart';
import 'package:real_firstprogram/provider/people_type.dart';
import 'FormInput.dart';
import 'chat_body.dart';

class Chat_structure extends StatelessWidget {
  People eachPeople;
  TranPeopleProvider tranPeoplePro;
  Chat_structure(this.tranPeoplePro, this.eachPeople);
  Color bg = Colors.black;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      Provider.of<TranChatProvider>(context, listen: false)
          .updatelist(eachPeople.title);
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<TranChatProvider>(context, listen: false)
              .updatelist(eachPeople.title);
        },
        label: Text("Just Button"),
      ),
      appBar: AppBar(
        title: Text(eachPeople.title),
      ),
      body: Column(
        children: [
          Expanded(child: ChatBody(eachPeople)),
          Input_chat(eachPeople)
        ],
      ),
    );
  }
}
