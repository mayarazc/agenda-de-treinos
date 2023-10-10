import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/model/treino_model.dart';
import 'package:flutter/material.dart';

class ExercicioTile extends StatelessWidget {
  final TreinoModel treino;
  const ExercicioTile({super.key, required this.treino});

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
                  child:
                      Text('Séries: ${treino.exercicios[index].series.toString()}'), 
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
                            treino.exercicios.removeAt(index);
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
                            print("ola");
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
