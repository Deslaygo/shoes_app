import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? titulo;
  final double? alto;
  final double? ancho;
  const CustomButton(
      {Key? key, this.titulo, this.alto = 50.0, this.ancho = 150.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      alignment: Alignment.center,
      height: alto,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(24)),
      child: Text(
        titulo!,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
