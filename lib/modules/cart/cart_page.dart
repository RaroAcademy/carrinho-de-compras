import 'package:carrinho_de_compras/modules/cart/cart_controller.dart';
import 'package:carrinho_de_compras/shared/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../state_builder.dart';

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
      body: StateBuilder<List<ProductModel>>(
        controller: widget.controller,
        builder: (_, state) {
          if (state.isEmpty) {
            return Center(child: Text("OPS! Seu carrinho está vazio"));
          } else {
            return ListView.builder(
                itemCount: state.length,
                itemBuilder: (_, index) => ListTile(
                      title: Text(state[index].name),
                      trailing: Text(state[index].price.toString()),
                      onTap: () {},
                    ));
          }
        },
      ),
    );
  }
}
