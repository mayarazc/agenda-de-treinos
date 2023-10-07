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
        alignment: WrapAlignment.start, 
        children: List.generate(
          lexercicios.length,
          (index) => SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size(20, 30)),
                        onPressed: () {},
                        child: const Text('Remover'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[300],
                            minimumSize: const Size(20, 30)),
                        onPressed: () {},
                        child: const Text('Editar'),
                      ),
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
