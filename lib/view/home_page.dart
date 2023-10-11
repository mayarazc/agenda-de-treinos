// ignore_for_file: must_call_super

import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/model/treino_model.dart';
import 'package:agendadetreinos/view/treino_tile.dart';
import 'package:agendadetreinos/view/modal_treino.dart';
import 'package:agendadetreinos/dados/treinos_db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _treinos = Hive.box('treinos');

  TreinosDB db = TreinosDB();

  @override
  void initState() {
    if (_treinos.get('treinos') == null) {
      db.criarBanco();
    } else {
      db.carregarDados();
    }
  }

  final controller = TextEditingController();

  void salvarTreino(String nomeTreino) {
    setState(() {
      db.treinos.add(TreinoModel(nomeTreino, []));
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  final nomeExercicioController = TextEditingController();
  final musculoController = TextEditingController();
  final seriesController = TextEditingController();
  final repeticoesController = TextEditingController();

  void adicionarExercicio(TreinoModel t) {
    ExercicioModel m = ExercicioModel(
        nomeExercicioController.text,
        musculoController.text,
        int.parse(seriesController.text),
        int.parse(repeticoesController.text));

    setState(() {
      db.adicionarExercicio(t, m);
      nomeExercicioController.clear();
      musculoController.clear();
      seriesController.clear();
      repeticoesController.clear();
    });
    Navigator.of(context).pop();
  }

  void removerExercicio(TreinoModel t, ExercicioModel exercicio) {
    setState(() {
      db.excluirExercicio(t, exercicio);
    });
  }

  void editarExercicio(TreinoModel t, ExercicioModel exercicioAntigo,
      ExercicioModel exercicioNovo) {
    setState(() {
      db.editarExercicio(t, exercicioAntigo, exercicioNovo);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text(
          'Agenda de Treinos',
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.treinos.length,
        itemBuilder: (context, index) {
          return TreinoTile(
            treino: db.treinos[index],
            nomeExercicioController: nomeExercicioController,
            musculoController: musculoController,
            seriesController: seriesController,
            repeticoesController: repeticoesController,
            salvarExercicio: (context) => adicionarExercicio(db.treinos[index]),
            removerExercicio: removerExercicio,
            editarExercicio: editarExercicio,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ModalTreino(
                controller: controller,
                salvar: (nomeTreino) {
                  salvarTreino(controller.text);
                },
              );
            },
          );
        },
        backgroundColor: Colors.deepPurple[200],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
