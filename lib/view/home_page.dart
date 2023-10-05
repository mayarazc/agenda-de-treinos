import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/model/treino_model.dart';
import 'package:agendadetreinos/view/treino_tile.dart';
import 'package:agendadetreinos/view/modal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final treinos = [
    const TreinoModel(
        "Treino A", [ExercicioModel("Remada Cavalinho", "Costas", 4, 12)]),
    const TreinoModel("Treino B", [
      ExercicioModel("Pulo", "Rosca", 3, 8),
      ExercicioModel("Caminhada", "Perna", 6, 7)
    ]),
  ];

  final controller = TextEditingController();

  void salvarTreino(String nomeTreino) {
    setState(() {
      treinos.add(TreinoModel(nomeTreino, []));
      controller.clear();
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
              color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: treinos.length,
        itemBuilder: (context, index) {
          return TreinoTile(
              nome: treinos[index].nome,
              lexercicios: treinos[index].exercicios);
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
        backgroundColor: Colors.grey[200],
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
