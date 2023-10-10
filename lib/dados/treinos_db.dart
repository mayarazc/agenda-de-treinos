import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:agendadetreinos/model/treino_model.dart';

class TreinosDB {
  final _treinos = Hive.box('treinos');

  List<TreinoModel> treinos = [];

  void criarBanco() {
    treinos = [
      TreinoModel("Treino A", []),
    ];
  }

  void carregarDados() {
    treinos = _treinos.get('treinos');
    print("/n/n/nAQUI passou 2");
  }

  void adicionarTreino(TreinoModel treino) {
    treinos.add(treino);
    atualizarTreinos();
  }

  void atualizarTreinos() {
    _treinos.put('treinos', treinos);
  }

  void adicionarExercicio(TreinoModel t, ExercicioModel exercicio) {
    int idx = treinos.indexOf(t);
    treinos[idx].exercicios.add(exercicio);
    atualizarTreinos();
  }

  void excluirExercicio(TreinoModel t, ExercicioModel exercicio) {
    int idx = treinos.indexOf(t);
    treinos[idx].exercicios.remove(exercicio);
    atualizarTreinos();
  }
}
