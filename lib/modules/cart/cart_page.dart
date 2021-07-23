import 'package:carrinho_de_compras/modules/cart/cart_controller.dart';
import 'package:carrinho_de_compras/shared/utils/extensions.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final CartController controller;
  CartPage({Key? key, required this.controller}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.controller.list.isEmpty
          ? Center(child: Text("OPS! Seu carrinho está vazio"))
          : ListView.builder(
              itemCount: widget.controller.list.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(widget.controller.list[index].name),
                trailing: Text(widget.controller.list[index].price.reais()),
                onTap: () {},
              ),
            ),
    );
  }
}
