import 'package:flutter/material.dart';
import 'package:sentimentos/model/sentimento.dart';
import 'package:sentimentos/model/tipo_sentimento.dart';

class TipoSentimentoPage extends StatefulWidget {
  final Function addTipoSentimento;
  final Sentimento sentimento;

  TipoSentimentoPage({
    @required this.sentimento,
    @required this.addTipoSentimento,
  });

  @override
  _TipoSentimentoPageState createState() => _TipoSentimentoPageState();
}

class _TipoSentimentoPageState extends State<TipoSentimentoPage> {
  double _slider;

  @override
  void initState() {
    super.initState();
    _slider = widget.sentimento.tipoSentimento.index.toDouble();
  }

  void _onChangedSlider(double value) {
    setState(() {
      _slider = value;
      widget.addTipoSentimento(TipoSentimento.values[value.round()]);
    });
  }

  _getColor() {
    return Color.lerp(Colors.blue, Colors.red, _slider / 4);
  }

  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Como está se sentindo agora?",
            style: Theme.of(context).textTheme.display1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              widget.sentimento.emoji,
              style: TextStyle(fontSize: 90),
            ),
          ),
          Text(
            widget.sentimento.nomeSentimento,
            style: Theme.of(context)
                .textTheme
                .display2
                .copyWith(color: _getColor()),
          ),
          Slider(
            min: 0,
            max: 4,
            value: _slider,
            onChanged: _onChangedSlider,
            activeColor: _getColor(),
          )
        ],
      ),
    );
  }
}
