import 'package:carrinho_de_compras/controller.dart';
import 'package:carrinho_de_compras/shared/models/product_model.dart';

class HomeController extends Controller<List<ProductModel>> {
  HomeController() : super([]);

  Future<void> getProducts() async {
    await Future.delayed(Duration(seconds: 2));
    update(List.generate(50,
        (index) => ProductModel(name: "Produto $index ", price: 1.0 * index)));
  }
}
