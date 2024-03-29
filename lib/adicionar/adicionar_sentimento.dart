import 'package:flutter/material.dart';
import 'package:sentimentos/adicionar/pages/pensamentos_page.dart';
import 'package:sentimentos/adicionar/pages/tipo_sentimentos_page.dart';
import 'package:sentimentos/model/sentimento.dart';
import 'package:sentimentos/model/tipo_sentimento.dart';

class AdicionarSentimento extends StatefulWidget {
  final Function salvar;

  AdicionarSentimento({this.salvar});

  @override
  _AdicionarSentimentoState createState() => _AdicionarSentimentoState();
}

class _AdicionarSentimentoState extends State<AdicionarSentimento> {
  PageController _controller;
  bool _firstPage;
  Sentimento _sentimento;

  @override
  void initState() {
    super.initState();
    _firstPage = true;
    _sentimento = Sentimento(tipoSentimento: TipoSentimento.FELIZ);
    _controller = PageController(initialPage: 0, keepPage: true);
    _controller.addListener(_onChangedPage);
  }

  @override
  void dispose() {
    _controller.removeListener(_onChangedPage);
    super.dispose();
  }

  void _onChangedPage() {
    setState(() {
      _firstPage = _controller.page == 0.0;
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_firstPage) {
          return true;
        } else {
          _controller.previousPage(
              duration: Duration(milliseconds: 280), curve: Curves.easeInOut);
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Adicionar"),
        ),
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            TipoSentimentoPage(
              sentimento: _sentimento,
              addTipoSentimento: _addTipoSentimento,
            ),
            PensamentosPage(
              addDescricao: _addPensamentos,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _next,
          child: _firstPage ? Icon(Icons.fast_forward) : Icon(Icons.check),
        ),
      ),
    );
  }

  void _addTipoSentimento(TipoSentimento tipo) {
    setState(() {
      _sentimento.tipoSentimento = tipo;
    });
  }

  void _addPensamentos(String value) {
    setState(() {
      _sentimento.pensamentos = value;
    });
  }

  void _next() async {
    if (_firstPage) {
      _controller.nextPage(
          duration: Duration(milliseconds: 280), curve: Curves.easeInOut);
    } else {
      if (_sentimento.pensamentos.isEmpty) {
        await showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text(
                "Ateção",
                textAlign: TextAlign.center,
              ),
              children: <Widget>[
                Text(
                  "Fale sobre seus pensamentos",
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        );
        return;
      }
      widget.salvar(_sentimento);
      Navigator.of(context).pop();
    }
  }
}
