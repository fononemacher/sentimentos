import 'package:flutter/material.dart';
import 'package:sentimentos/views/sentimentosview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff54778F),
            accentColor: Color(0xff54778F),
      ),
      home: SentimentosView(),
    );
  }
}
