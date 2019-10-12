import 'package:flutter/material.dart';
import 'package:sentimentos/model/sentimento.dart';
import 'package:sentimentos/model/tipo_sentimento.dart';

class TipoSentimentoPage extends StatefulWidget {
  @override
  _TipoSentimentoPageState createState() => _TipoSentimentoPageState();
}

class _TipoSentimentoPageState extends State<TipoSentimentoPage> {
  Sentimento _sentimento;
  double _slider;

  @override
  void initState() {
    super.initState();
    _slider = 0;
    _sentimento = Sentimento(tipoSentimento: TipoSentimento.FELIZ);
  }

  void _onChangedSlider(double value) {
    setState(() {
      _slider = value;
      _sentimento.tipoSentimento = TipoSentimento.values[value.round()];
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
              _sentimento.emoji,
              style: TextStyle(fontSize: 90),
            ),
          ),
          Text(
            _sentimento.nomeSentimento,
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
