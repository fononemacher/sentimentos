import 'package:flutter/material.dart';
import 'package:sentimentos/adicionar/adicionar_sentimento.dart';
import 'package:sentimentos/model/sentimento.dart';
import 'package:sentimentos/model/tipo_sentimento.dart';
import 'package:sentimentos/widgets/sentimento_tile.dart';

class SentimentosView extends StatefulWidget {
  @override
  _SentimentosViewState createState() => _SentimentosViewState();
}

class _SentimentosViewState extends State<SentimentosView> {
  List<Sentimento> _sentimentos = [
//    Sentimento(
//        tipoSentimento: TipoSentimento.FELIZ,
//        pensamentos: "Estou feliz porque..."),
//    Sentimento(
//        tipoSentimento: TipoSentimento.INDIFERENTE,
//        pensamentos: "Estou indiferente porque..."),
//    Sentimento(
//        tipoSentimento: TipoSentimento.NORMAL,
//        pensamentos: "Estou normal porque..."),
//    Sentimento(
//        tipoSentimento: TipoSentimento.TRISTE,
//        pensamentos: "Estou triste porque..."),
//    Sentimento(
//        tipoSentimento: TipoSentimento.RAIVA,
//        pensamentos: "Estou com raiva!!!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentimentos"),
      ),
      body: Container(
        child: _sentimentos.isEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Text(
                  "Nenhum sentimento criado",
                  style: Theme.of(context).textTheme.display1,
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                itemCount: _sentimentos.length,
                itemBuilder: (context, int index) {
                  Sentimento sentimento = _sentimentos[index];
                  return SentimentoTile(sentimento: sentimento);
                },
                separatorBuilder: (context, int index) {
                  return Divider(color: Colors.black);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSentimento,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: _removeSentimento,
            )
          ],
        ),
      ),
    );
  }

  _salvar(Sentimento sentimento) {
    setState(() {
      _sentimentos.add(sentimento);
    });
  }

  _addSentimento() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => AdicionarSentimento(salvar: _salvar),
    ));
  }

  _removeSentimento() {
    setState(() {
      _sentimentos=[];
    });
  }
}
