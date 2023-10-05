import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  VoidCallback onPressed;

  Botao({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.deepPurple,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
