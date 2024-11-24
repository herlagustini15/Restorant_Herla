import 'package:flutter/foundation.dart';
import 'package:pemesanan_makanan/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cart = [];
  List<CartModel> get cart => _cart;
  int _total = 0;
  int get total => total;

  void addRemove(String name, int menuId, bool isAdd) {
    if (_cart.where((element) => menuId == element.menuId).isNotEmpty) {
      // sudah mengandung id yg diklik
      var index = _cart.indexWhere((element) => element.menuId == menuId);
      _cart[index].quatity = (isAdd)
          ? _cart[index].quatity + 1
          : (_cart[index].quatity > 0)
              ? _cart[index].quatity - 1
              : 0;

      _total = (isAdd)
          ? _total + 1
          : (_total > 0)
              ? _total - 1
              : 0;
    } else {
      // belum ada
      _cart.add(CartModel(name: name, menuId: menuId, quatity: 1));
      _total = _total + 1;
    }

    notifyListeners();
  }
}
