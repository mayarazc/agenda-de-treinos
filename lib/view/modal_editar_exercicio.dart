import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:agendadetreinos/model/treino_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalEditarExercicio extends StatefulWidget {
  final TextEditingController controllerNome;
  final TextEditingController controllerMusculo;
  final TextEditingController controllerSeries;
  final TextEditingController controllerRepeticoes;
  final Function salvar;
  final TreinoModel treino;
  final ExercicioModel exercicioAntigo;


  const ModalEditarExercicio(
      {super.key,
      required this.controllerNome,
      required this.controllerMusculo,
      required this.controllerSeries,
      required this.controllerRepeticoes,
      required this.salvar,
      required this.treino,
      required this.exercicioAntigo});

  @override
  State<ModalEditarExercicio> createState() => _ModalState();
}

class _ModalState extends State<ModalEditarExercicio> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "EDITAR EXERCÍCIO",
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.controllerNome,
                ),
                TextFormField(
                  controller: widget.controllerMusculo,
                ),
                TextFormField(
                  controller: widget.controllerSeries,
                ),
                TextFormField(
                  controller: widget.controllerRepeticoes,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    int series = int.parse(widget.controllerSeries.text);
                    int repeticoes =
                        int.parse(widget.controllerRepeticoes.text);
                    widget.salvar(
                        widget.treino,
                        widget.exercicioAntigo,
                        ExercicioModel(widget.controllerNome.text,
                            widget.controllerMusculo.text, series, repeticoes));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepPurple,
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(40, 40),
                    ),
                  ),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
