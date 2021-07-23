import 'package:carrinho_de_compras/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final list = <ProductModel>[];

  @observable
  String listLength = "0";

  @action
  void addItem(ProductModel product) {
    list.add(product);
    listLength = list.length.toString();
  }
}
