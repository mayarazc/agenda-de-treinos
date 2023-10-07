import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:flutter/material.dart';

class ExercicioTile extends StatelessWidget {
  final List<ExercicioModel> lexercicios;
  const ExercicioTile({super.key, required this.lexercicios});

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
          lexercicios.length,
          (index) => SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Exercício: ${lexercicios[index].nome}')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Músculo: ${lexercicios[index].musculo}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text('Séries: ${lexercicios[index].series.toString()}'), 
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Repetições: ${lexercicios[index].repeticoes.toString()}'),
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
                        child: const Icon(
                          Icons.delete,
                          size: 15,
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
                        child: const Icon(
                          Icons.edit,
                          size: 15,
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
