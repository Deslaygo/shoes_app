import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/zapato.dart';
import 'package:shoes_app/screens/zapato_screen.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Zapato()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ZapatoScreen(),
    );
  }
}
