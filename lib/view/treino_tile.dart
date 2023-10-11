//import 'package:agendadetreinos/model/botao.dart';
// ignore: unused_import
import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/model/treino_model.dart';
import 'package:agendadetreinos/view/exercicio_tile.dart';
import 'package:agendadetreinos/view/modal_exercicio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TreinoTile extends StatelessWidget {
  final TreinoModel treino;
  final Function salvarExercicio;
  final Function removerExercicio;
  final Function editarExercicio;
  final TextEditingController nomeExercicioController;
  final TextEditingController musculoController;
  final TextEditingController seriesController;
  final TextEditingController repeticoesController;

  const TreinoTile(
      {super.key,
      required this.treino,
      required this.salvarExercicio,
      required this.removerExercicio,
      required this.editarExercicio,
      required this.musculoController,
      required this.nomeExercicioController,
      required this.repeticoesController,
      required this.seriesController});

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
                treino.nome.toUpperCase(),
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ExercicioTile(treino: treino, removerExercicio: removerExercicio, editarExercicio: editarExercicio,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                child: const Text('Adicionar exercício'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ModalExercicio(
                        controllerNome: nomeExercicioController,
                        controllerMusculo: musculoController,
                        controllerSeries: seriesController,
                        controllerRepeticoes: repeticoesController,
                        salvar: salvarExercicio,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
