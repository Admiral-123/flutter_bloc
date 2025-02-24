part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListIntialEvent extends WishlistEvent {}

class WishListRemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel product;

  WishListRemoveFromWishlistEvent({required this.product});
}
