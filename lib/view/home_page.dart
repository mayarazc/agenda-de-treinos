// ignore_for_file: must_call_super

import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/model/treino_model.dart';
import 'package:agendadetreinos/view/treino_tile.dart';
import 'package:agendadetreinos/view/modal.dart';
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

  void adicionarExercicio(ExercicioModel exercicio) {
    setState(() {
      db.exercicios.add(exercicio);
      nomeExercicioController.clear();
      musculoController.clear();
      seriesController.clear();
      repeticoesController.clear();
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
            nome: db.treinos[index].nome,
            lexercicios: db.treinos[index].exercicios,
            nomeExercicioController: nomeExercicioController,
            musculoController: musculoController,
            seriesController: seriesController,
            repeticoesController: repeticoesController,
            salvarExercicio: adicionarExercicio,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Modal(
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
