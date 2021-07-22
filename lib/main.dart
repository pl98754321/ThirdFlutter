import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/provider/people_provider.dart';
import 'package:real_firstprogram/provider/chat_provider.dart';
import 'package:real_firstprogram/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return TranPeopleProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return TranChatProvider();
          },
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: homepage(),
        title: "MaterialApp_title",
      ),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return homescreen();
  }
}
