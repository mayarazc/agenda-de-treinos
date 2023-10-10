import 'package:agendadetreinos/model/exercicio_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalExercicio extends StatefulWidget {
  final TextEditingController controllerNome;
  final TextEditingController controllerMusculo;
  final TextEditingController controllerSeries;
  final TextEditingController controllerRepeticoes;
  final Function salvar;

  const ModalExercicio(
      {super.key,
      required this.controllerNome,
      required this.controllerMusculo,
      required this.controllerSeries,
      required this.controllerRepeticoes,
      required this.salvar});

  @override
  State<ModalExercicio> createState() => _ModalState();
}

class _ModalState extends State<ModalExercicio> {
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
                  "CRIAR TREINO",
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
                  decoration: const InputDecoration(
                    labelText: "Digite o nome do exercício",
                  ),
                ),
                TextFormField(
                  controller: widget.controllerMusculo,
                  decoration: const InputDecoration(
                    labelText: "Digite o músculo trabalhado",
                  ),
                ),
                TextFormField(
                  controller: widget.controllerSeries,
                  decoration: const InputDecoration(
                    labelText: "Digite o número de séries",
                  ),
                ),
                TextFormField(
                  controller: widget.controllerRepeticoes,
                  decoration: const InputDecoration(
                    labelText: "Digite o músculo de repetições",
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    int series = int.parse(widget.controllerSeries.text);
                    int repeticoes =
                        int.parse(widget.controllerRepeticoes.text);
                    widget.salvar(ExercicioModel(widget.controllerNome.text,
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
                    "Criar",
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
