import 'package:carrinho_de_compras/modules/cart/cart_controller.dart';
import 'package:carrinho_de_compras/modules/cart/cart_page.dart';
import 'package:carrinho_de_compras/modules/home/home_controller.dart';
import 'package:carrinho_de_compras/shared/models/product_model.dart';
import 'package:carrinho_de_compras/state_builder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final cartController = CartController();

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CartPage(
                              controller: cartController,
                            )));
              },
              icon: Stack(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: StateBuilder<List<ProductModel>>(
                        builder: (_, state) => CircleAvatar(
                              radius: 9,
                              child: Text(
                                state.length.toString(),
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                        controller: cartController),
                  )
                ],
              ))
        ],
      ),
      body: StateBuilder<List<ProductModel>>(
        controller: controller,
        builder: (_, state) {
          if (state.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: state.length,
                itemBuilder: (_, index) => ListTile(
                      title: Text(state[index].name),
                      trailing: Text(state[index].price.toString()),
                      onTap: () {
                        cartController.addItem(state[index]);
                      },
                    ));
          }
        },
      ),
    );
  }
}
