import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:flutter/material.dart';

class ExercicioTile extends StatelessWidget {
  final List<ExercicioModel> lexercicios;
  const ExercicioTile({super.key, required this.lexercicios});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          children: 
            //lexercicios.map((e) => Text(e.musculo)).toList()
            List.generate(lexercicios.length, (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Exercício: ${lexercicios[index].nome}')
                ), 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Músculo: ${lexercicios[index].musculo}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Séries: ${lexercicios[index].series.toString()}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Repetições: ${lexercicios[index].repeticoes.toString()}'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}