import 'package:carrinho_de_compras/modules/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carrinho de compras',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomePage());
  }
}
