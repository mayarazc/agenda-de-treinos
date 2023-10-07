import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modal extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) salvar;
  const Modal({super.key, required this.controller, required this.salvar});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {

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
          Container(
            width: 52,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(16),
            ),
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
                    fontFamily: GoogleFonts.inter().fontFamily, // Use a fonte corretamente
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.controller,
                  decoration: const InputDecoration(
                    labelText: "Digite um nome para o treino",
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.salvar(widget.controller.text);
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