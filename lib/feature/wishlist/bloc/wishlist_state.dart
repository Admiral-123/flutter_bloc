part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishListActionState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItem;

  WishlistSuccessState({required this.wishlistItem});
}

class WishlistRemoveState extends WishlistState {}
