import 'package:flutter/material.dart';
import 'package:sentimentos/model/sentimento.dart';

class SentimentoTile extends StatelessWidget {
  final Sentimento sentimento;

  SentimentoTile({this.sentimento});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sentimento.nomeSentimento),
      subtitle: Text(sentimento.pensamentos),
      leading: Text(
        sentimento.emoji,
        style: TextStyle(fontSize: 35),
      ),
      isThreeLine: true,
    );
  }
}
