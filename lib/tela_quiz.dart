import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': 'Qual é a capital do Brasil?',
      'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro', 'Salvador'],
      'respostaCorreta': 'Brasília',
    },
    {
      'pergunta': 'Qual é a capital da França?',
      'opcoes': ['Londres', 'Madrid', 'Paris', 'Berlim'],
      'respostaCorreta': 'Paris',
    },
     
    {
      'pergunta': 'Qual é o maior planeta do Sistema Solar?',
      'opcoes': ['Terra', 'Marte', 'Júpiter', 'Saturno'],
      'respostaCorreta': 'Júpiter',
    },
  {
  'pergunta': 'Quantos jogadores tem um time de futebol em campo?',
  'opcoes': ['12', '14', '11', '16'],
  'respostaCorreta': '11',
  },
  {
  'pergunta': 'Quem escreveu "Dom Casmurro"?',
  'opcoes': ['Machado de Assis', 'José de Alencar', 'Jorge Amado', 'Clarice Lispector'],
  'respostaCorreta':'Machado de Assis',
  },

{
'pergunta': 'Qual é o maior deserto do mundo?',
'opcoes' : ['Deserto do Saara', 'Deserto da Antártica', 'Deserto de Gobi', 'Deserto de Kalahari'],
'respostaCorreta': 'Deserto da Antártica',
},

{
  'pergunta': 'Qual é o nome do super-herói que é conhecido como o "Homem de Ferro"?',
  'opcoes' : ['Bruce Wayne', 'Tony Stark', ' Peter Parker', ' Clark Kent'],
  'respostaCorreta': 'Tony Stark',
},

{
'pergunta': 'Quem pintou a Mona Lisa?',
'opcoes':[' Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci',' Michelangelo'],
'respostaCorreta': 'Leonardo da Vinci',
},

{
  'pergunta': 'Em que ano o homem pisou na Lua pela primeira vez?',
  'opcoes': [' 1965', ' 1969','1972', ' 1980'],
  'respostaCorreta': '1969',
},

{
 'pergunta': 'Qual é a capital da Austrália?',
 'opcoes': ['Sydney','Melbourne', 'Canberra', 'Brisbane'],
 'respostaCorreta': ' Canberra',

}, 
  ];

  int _indicePergunta = 0;
  int _pontuacao = 0;

  void _verificarResposta(String respostaSelecionada) {
    final respostaCorreta = _perguntas[_indicePergunta]['respostaCorreta'] as String;

    setState(() {
      if (respostaSelecionada == respostaCorreta) {
        _pontuacao++;
      }
      if (_indicePergunta < _perguntas.length - 1) {
        _indicePergunta++;
      } else {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaResultado(
              pontuacao: _pontuacao,
              totalPerguntas: _perguntas.length,
            ),
          ),
        );
        _indicePergunta = 0;
        _pontuacao = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Image.asset(
              '',
            ),
          ),
          Expanded(
            flex: 7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _perguntas[_indicePergunta]['pergunta'] as String,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...(_perguntas[_indicePergunta]['opcoes'] as List<String>).map((opcao) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        onPressed: () => _verificarResposta(opcao),
                        child: Text(opcao),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}