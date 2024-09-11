import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> questoes;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.questoes,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < questoes.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? questoes[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(questoes[perguntaSelecionada]['pergunta'].toString()),
        ...respostas.map((resp) => Resposta(resp['numero'] as String,
            () => quandoResponder(int.parse(resp['ponto'].toString())))),
      ],
    );
  }
}
