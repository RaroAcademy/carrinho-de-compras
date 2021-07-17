import 'package:carrinho_de_compras/shared/models/product_model.dart';

import '../../controller.dart';

class CartController extends Controller<List<ProductModel>> {
  CartController() : super([]);

  void addItem(ProductModel product) {
    final list = state;
    list.add(product);
    update(list);
  }
}
