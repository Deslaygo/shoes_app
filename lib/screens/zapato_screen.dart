import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helper.dart';
import 'package:shoes_app/screens/zapato_desc_screen.dart';
import 'package:shoes_app/widgets/custom_widgets.dart';

class ZapatoScreen extends StatelessWidget {
  const ZapatoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'zapato-1',
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppbar(title: 'For you'),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        cambiarStatusLight();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ZapatoDescScreen()));
                      },
                      child: const ZapatoPreview(),
                    ),
                    const ZapatoDesc(
                      titulo: 'Nike Air Max 720',
                      descripcion:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                  ],
                ),
              ),
            ),
            const AgregarCarrito(
              monto: 850.90,
            ),
          ],
        ),
      ),
    );
  }
}
