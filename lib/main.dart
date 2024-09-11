import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _questoes = const [
    {
      'pergunta': 'Quanto é 1 + 1?',
      'respostas': [
        {'numero': '2', 'ponto': 1},
        {'numero': '3', 'ponto': 0},
        {'numero': '6', 'ponto': 0},
        {'numero': '7', 'ponto': 0},
      ],
    },
    {
      'pergunta': 'Quanto é 3 x 5?',
      'respostas': [
        {'numero': '8', 'ponto': 0},
        {'numero': '15', 'ponto': 1},
        {'numero': '18', 'ponto': 0},
        {'numero': '37', 'ponto': 0},
      ],
    },
    {
      'pergunta': 'Quanto é 49 ÷ 7?',
      'respostas': [
        {'numero': '7', 'ponto': 1},
        {'numero': '14', 'ponto': 0},
        {'numero': '42', 'ponto': 0},
        {'numero': '49', 'ponto': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _questoes.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              questoes: _questoes,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder)
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
