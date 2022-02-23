import 'package:captain_app/blocs/base_bloc.dart';
import 'package:captain_app/shared/models/item_model.dart';
import 'package:rxdart/subjects.dart';

class CartBloc extends Bloc {
  final List<Item> _cartItems = [];
  final BehaviorSubject<bool> _loadingController =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<List<Item>> _cartController =
      BehaviorSubject<List<Item>>.seeded([]);

  Stream<List<Item>> get cartItemsStream => _cartController.stream;

  Stream<bool> get loadingController => _loadingController.stream;

  List<Item> get cartItems => _cartItems;

  Function get addToCart => _addToCart;
  Function get removeFromCart => _removeFromCart;
  Function get getCartTotal => _getCartTotal;
  Function get itemCount => _getItemCount;

  _addToCart(Item item) {
    _loadingController.add(true);

    _cartItems.add(item);
    _cartController.add(_cartItems);

    _loadingController.add(false);
  }

  _removeFromCart(Item item) {
    _loadingController.add(true);

    int index = _cartItems.indexOf(item);

    if (index != -1) {
      _cartItems.removeAt(index);

      _cartController.add(_cartItems);
    }
    // _cartItems.remove(item);

    _loadingController.add(false);
  }

  _getCartTotal() {
    return _cartItems.length;
  }

  //funtion to get item count in cart
  _getItemCount(Item item) {
    return _cartItems.where((c) => c.id == item.id).toList().length;
  }

  @override
  void dispose() {
    _cartController.close();
    _loadingController.close();
  }
}

final CartBloc cartBloc = CartBloc();
