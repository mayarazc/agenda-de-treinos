// ignore_for_file: file_names

import 'package:agendadetreinos/model/exercicio_model.dart';

class TreinoModel{
  final String nome;
  final List<ExercicioModel> exercicios;

  const TreinoModel(this.nome, this.exercicios);
}