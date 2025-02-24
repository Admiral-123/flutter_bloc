part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartRemovestate extends CartState {}
