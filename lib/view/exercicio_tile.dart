// ignore: unused_import
import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/model/treino_model.dart';
import 'package:agendadetreinos/view/modal_editar_exercicio.dart';
import 'package:flutter/material.dart';

class ExercicioTile extends StatelessWidget {
  final TreinoModel treino;
  final Function removerExercicio;
  final Function editarExercicio;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController musculoController = TextEditingController();
  final TextEditingController seriesController = TextEditingController();
  final TextEditingController repeticoesController = TextEditingController();

  ExercicioTile(
      {super.key,
      required this.treino,
      required this.removerExercicio,
      required this.editarExercicio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 1.0,
        runSpacing: 2.0,
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: List.generate(
          treino.exercicios.length,
          (index) => SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Exercício: ${treino.exercicios[index].nome}')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Músculo: ${treino.exercicios[index].musculo}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Séries: ${treino.exercicios[index].series.toString()}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Repetições: ${treino.exercicios[index].repeticoes.toString()}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            removerExercicio(treino, treino.exercicios[index]);
                          },
                          iconSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            nomeController.text = treino.exercicios[index].nome;
                            musculoController.text = treino.exercicios[index].musculo;
                            seriesController.text = treino.exercicios[index].series.toString();
                            repeticoesController.text = treino.exercicios[index].repeticoes.toString();

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ModalEditarExercicio(
                                  controllerNome: nomeController,
                                  controllerMusculo: musculoController,
                                  controllerSeries: seriesController,
                                  controllerRepeticoes: repeticoesController,
                                  salvar: editarExercicio,
                                  treino: treino,
                                  exercicioAntigo: treino.exercicios[index],
                                );
                              },
                            );
                          },
                          iconSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
