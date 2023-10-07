import 'package:agendadetreinos/model/botao.dart';
import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/view/exercicio_tile.dart';
import 'package:agendadetreinos/view/modal_exercicio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TreinoTile extends StatelessWidget {
  final String nome;
  final List<ExercicioModel> lexercicios;
  Function(BuildContext?)? salvarExercicio;

  TreinoTile(
      {super.key,
      required this.nome,
      required this.lexercicios,
      required this.salvarExercicio});

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Botao(
              texto: 'Adicionar exercício',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ModalExercicio(
                      controllerNome: naoseimeajuda,
                      controllerMusculo: helphenrique,
                      controllerSeries: facaalgopf,
                      controllerRepeticoes: naofunciona,
                      salvar: ajudaa,
                    );
                  },
                );
              },
            )
          ],
        ));
  }
}
