import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:agendadetreinos/model/treino_model.dart';

class TreinosDB {
  final _treinos = Hive.box('treinos');
  final _exercicios = Hive.box('exercicios');

  List<TreinoModel> treinos = [];
  List<ExercicioModel> exercicios = [];

  void criarBanco() {
    exercicios = [];

    treinos = [
      TreinoModel("Treino A", exercicios),
    ];
  }

  void carregarDados() {
    treinos = _treinos.get('treinos');
  }

  void adicionarTreino(TreinoModel treino) {
    treinos.add(treino);
    atualizarTreinos();
  }

  void atualizarTreinos() {
    _treinos.put('treinos', treinos);
  }

  void adicionarExercicio(ExercicioModel exercicio) {
    exercicios.add(exercicio);
    atualizarExercicios();
  }

  void atualizarExercicios(){
    _exercicios.put('exercicios', exercicios);
  }
}
