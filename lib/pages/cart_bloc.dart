// cart_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week04/pages/food.dart';
import 'package:week04/pages/shop.dart';

// Events
abstract class CartEvent {}

class RemoveFromCartEvent extends CartEvent {
  final Food food;
  RemoveFromCartEvent(this.food);
}

// States
class CartState {
  final List<Food> cart;
  CartState(this.cart);
}

// BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  final Shop shop;

  CartBloc(this.shop) : super(CartState([]));

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is RemoveFromCartEvent) {
      shop.removeFromCart(event.food);
      yield CartState(List.from(shop.cart));
    }
  }
}
