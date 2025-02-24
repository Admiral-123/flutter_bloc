import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/wishlist_items.dart';
import 'package:learn_bloc/feature/home/models/home_product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListIntialEvent>(wishListIntialEvent);
    on<WishListRemoveFromWishlistEvent>(wishListRemoveFromWishlistEvent);
  }

  FutureOr<void> wishListIntialEvent(
      WishListIntialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItem: wishListItems));
  }

  FutureOr<void> wishListRemoveFromWishlistEvent(
      WishListRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.product);
    emit(WishlistSuccessState(wishlistItem: wishListItems));
  }
}
