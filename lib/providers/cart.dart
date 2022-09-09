import 'package:flutter/foundation.dart';


class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({required this.id, required this.title, required this.price, required this.quantity});
}


class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem ( String productId, String title, double price,){
    if(_items.containsKey(productId)){
      //... quantity add
      _items.update(productId, (existingCartItem) => CartItem(id: existingCartItem.id, title: existingCartItem.title, price: existingCartItem.price, quantity: existingCartItem.quantity + 1));
    } else {
    _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, price: price, quantity: 1));
  }
    notifyListeners();
 }
}