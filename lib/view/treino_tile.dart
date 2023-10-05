import 'package:agendadetreinos/model/botao.dart';
import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/view/exercicio_tile.dart';
import 'package:flutter/material.dart';

class TreinoTile extends StatelessWidget {
  final String nome;
  final List<ExercicioModel> lexercicios;

  const TreinoTile({super.key, required this.nome, required this.lexercicios});

  @override
  Widget build(BuildContext context) {

    return Card(
        margin: const EdgeInsets.all(10),
        color: Colors.white,
        shadowColor: Colors.blueGrey,
        elevation: 20,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                nome.toUpperCase(),
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                
              ),
            ),
            ExercicioTile(lexercicios: lexercicios),
            Botao(texto: 'Adicionar exercício', onPressed: () => {})
          ],
        ));
  }
}
