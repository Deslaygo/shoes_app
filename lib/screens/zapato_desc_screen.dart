import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/app_assets.dart';
import 'package:shoes_app/helpers/helper.dart';
import 'package:shoes_app/models/zapato.dart';
import 'package:shoes_app/widgets/custom_widgets.dart';

class ZapatoDescScreen extends StatelessWidget {
  const ZapatoDescScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            const Hero(
              tag: 'zapato-1',
              child: ZapatoPreview(
                fullScreen: true,
              ),
            ),
            Positioned(
              top: 16,
              child: IconButton(
                onPressed: () {
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.chevron_left,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: const [
              ZapatoDesc(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              _MontoBuyNow(),
              _ColoresYMas(),
              _BotonesCompartir()
            ],
          ),
        )),
      ],
    ));
  }
}

class _BotonesCompartir extends StatelessWidget {
  const _BotonesCompartir({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _BotonSombreado(
              icon: Icon(Icons.favorite, color: Colors.red),
            ),
            _BotonSombreado(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.black38,
              ),
            ),
            _BotonSombreado(
              icon: Icon(
                Icons.settings,
                color: Colors.black38,
              ),
            ),
          ],
        ));
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon? icon;
  const _BotonSombreado({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 30,
                  child: _BotonColor(
                    color: Color(0xfff1c40f),
                    position: 1,
                    asset: AppAssets.zapatoAmarillo,
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(
                    color: Color(0xff2980b9),
                    position: 2,
                    asset: AppAssets.zapatoAzul,
                  ),
                ),
                Positioned(
                  left: 90,
                  child: _BotonColor(
                    color: Color(0xff2c3e50),
                    position: 3,
                    asset: AppAssets.zapatoNegro,
                  ),
                ),
                _BotonColor(
                  color: Color(0xff27ae60),
                  position: 4,
                  asset: AppAssets.zapatoVerde,
                ),
              ],
            ),
          ),
          const CustomButton(
            titulo: 'More related items',
            alto: 30,
            ancho: 150,
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color? color;
  final int? position;
  final String? asset;
  const _BotonColor({
    Key? key,
    this.color,
    this.position,
    this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: position! * 100),
      duration: const Duration(milliseconds: 300),
      child: InkWell(
        onTap: () {
          final zapato = Provider.of<Zapato>(context, listen: false);
          zapato.imageAsset = asset!;
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          children: [
            const Text(
              '\$950.90',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(milliseconds: 300),
              from: 10,
              child: const CustomButton(
                titulo: 'Buy now',
                alto: 40,
                ancho: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}
