import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helper.dart';
import 'package:shoes_app/screens/zapato_desc_screen.dart';
import 'package:shoes_app/widgets/custom_widgets.dart';

class ZapatoScreen extends StatelessWidget {
  const ZapatoScreen({Key? key}) : super(key: key);

  void enviarDescripcionSlide(BuildContext context) {
    Navigator.push(context, fadeTransitionRoute(context));
  }

  Route slideTransitionRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            const ZapatoDescScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(0.0, 0.8), end: Offset.zero)
                    .animate(curveAnimation),
            child: child,
          );
        });
  }

  Route scaleTransitionRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            const ZapatoDescScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          return ScaleTransition(
              scale:
                  Tween<double>(begin: 0.5, end: 1.0).animate(curveAnimation),
              child: child);
        });
  }

  Route rotationTransitionRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            const ZapatoDescScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          return RotationTransition(
              turns:
                  Tween<double>(begin: 0.8, end: 1.0).animate(curveAnimation),
              child: child);
        });
  }

  Route fadeTransitionRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            const ZapatoDescScreen(),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          return FadeTransition(
              opacity:
                  Tween<double>(begin: 0.2, end: 1.0).animate(curveAnimation),
              child: child);
        });
  }

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
                        enviarDescripcionSlide(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             const ZapatoDescScreen()));
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
