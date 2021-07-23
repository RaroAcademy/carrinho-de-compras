import 'package:carrinho_de_compras/shared/models/cart_item.dart';
import 'package:carrinho_de_compras/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<CartItem> list = ObservableList.of(<CartItem>[]);

  @observable
  String listLength = "0";

  @observable
  String cartPrice = "0.0";

  @action
  void addItem(ProductModel product) {
    if (list.any((element) => element.product == product)) {
      final _index = list.indexWhere((element) => element.product == product);
      final _cartItem = list[_index];
      list[_index] = _cartItem.copyWith(quantity: _cartItem.quantity + 1);
    } else {
      list.add(CartItem(product: product, quantity: 1));
    }
    attListSize();
  }

  @action
  void removeItem(ProductModel product) {
    if (list.any((element) => element.product == product)) {
      final _index = list.indexWhere((element) => element.product == product);
      if (list[_index].quantity > 1) {
        final _cartItem = list[_index];
        list[_index] = _cartItem.copyWith(quantity: _cartItem.quantity - 1);
      } else {
        list.removeAt(_index);
      }
    }
    attListSize();
  }

  @action
  void attListSize() {
    double _cartPrice = 0.0;
    int _listSize = 0;

    list.forEach((element) {
      _listSize += element.quantity;
      _cartPrice += element.quantity * element.product.price;
    });

    listLength = _listSize.toString();
    cartPrice = _cartPrice.reais();
  }
}
