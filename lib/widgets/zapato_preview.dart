import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/app_assets.dart';
import 'package:shoes_app/models/zapato.dart';

class ZapatoPreview extends StatelessWidget {
  final bool fullScreen;
  const ZapatoPreview({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fullScreen ? 4 : 24,
        vertical: fullScreen ? 5 : 0,
      ),
      child: Container(
        width: double.infinity,
        height: fullScreen ? 410 : 430,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: fullScreen
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              : BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            const _ZapatoConSombra(),
            if (!fullScreen) const _ZapatoTallas(),
          ],
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaItem(numero: 22),
          _TallaItem(numero: 23),
          _TallaItem(numero: 24),
          _TallaItem(
            numero: 25,
            seleccionado: true,
          ),
          _TallaItem(numero: 26),
          _TallaItem(numero: 27),
        ],
      ),
    );
  }
}

class _TallaItem extends StatelessWidget {
  final int? numero;
  final bool seleccionado;
  const _TallaItem({
    Key? key,
    this.numero,
    this.seleccionado = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapato = Provider.of<Zapato>(context);
    return InkWell(
      onTap: () {
        final zapato = Provider.of<Zapato>(context, listen: false);
        zapato.talla = numero!;
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              zapato.talla == numero ? const Color(0xfff39c12) : Colors.white,
          boxShadow: zapato.talla == numero
              ? const [BoxShadow(color: Colors.black26, blurRadius: 20)]
              : [],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          numero.toString(),
          style: TextStyle(
            fontSize: 16,
            color:
                zapato.talla == numero ? Colors.white : const Color(0xffFFCF53),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapato = Provider.of<Zapato>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(
            child: _ZapatoSombra(),
            bottom: 20,
            right: 0,
          ),
          Image.asset(zapato.imageAsset),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(blurRadius: 40, color: Color(0xffEAA14E))
            ]),
      ),
    );
  }
}
