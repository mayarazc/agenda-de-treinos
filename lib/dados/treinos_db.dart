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

  void editarExercicio(TreinoModel t, ExercicioModel exercicioAntigo,ExercicioModel exercicioNovo) {
    int indiceTreino = treinos.indexOf(t);

    if (indiceTreino != -1) {
      int indiceExercicio = treinos[indiceTreino].exercicios.indexOf(exercicioAntigo);
      if (indiceExercicio != -1) {
        treinos[indiceTreino].exercicios[indiceExercicio] = exercicioNovo;
        atualizarTreinos();
      }
    }
  }
}
