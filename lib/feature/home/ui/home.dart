import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/feature/cart/ui/cart.dart';
import 'package:learn_bloc/feature/home/bloc/home_bloc.dart';
import 'package:learn_bloc/feature/home/ui/product_tile_widget.dart';
import 'package:learn_bloc/feature/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeIntitalEvent());
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      /*
      The listener only executes when the current state is of type HomeActionState.
      This prevents unnecessary executions of listener.

      It ensures that only specific action-based states (like navigation) trigger the listener.
      Prevents the listener from running when non-action states (like HomeLoadingState) are emitted.
      */
      buildWhen: (previous, current) => current is! HomeActionState,
      /*
      The UI only rebuilds when current is not a HomeActionState.
      This prevents unnecessary UI rebuilds when an action state (like navigation) is emitted.

      Prevents rebuilding the UI when states like HomeNavigateToWishListPageActionState are emitted.
      Ensures the UI only rebuilds when real UI-related states (like HomeLoadedSuccessState) change.
      */
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeProductCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("added to cart")));
        } else if (state is HomeProductItemWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("added to wishlist")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final succesState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text("Grocery App"),
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishListButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productDataModel: succesState.products[index],
                    homeBloc: homeBloc,
                  );
                },
                itemCount: succesState.products.length,
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('something went wrong'),
              ),
            );
          default:
            return Scaffold(
              body: Center(),
            );
        }
      },
    );
  }
}
