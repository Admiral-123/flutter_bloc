part of 'home_bloc.dart';

@immutable
sealed class HomeState {} // sealed prevents a class from being extended or implemented outside its own library

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  HomeLoadedSuccessState({required this.products});
  final List<ProductDataModel> products;
  // when home loading is success we get list of products
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishListedActionState extends HomeActionState {}

class HomeProductCartedActionState extends HomeActionState {}

/*
Defines all possible states your feature can be in.
States are outputs from the BLoC.
*/
