import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/feature/wishlist/bloc/wishlist_bloc.dart';
import 'package:learn_bloc/feature/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistPage();
}

class _WishlistPage extends State<Wishlist> {
  WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishListIntialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final succesState = state as WishlistSuccessState;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                      productDataModel: succesState.wishlistItem[index],
                      wishlistBloc: wishlistBloc);
                },
                itemCount: succesState.wishlistItem.length,
              );

            default:
              return Container();
          }
          // return Container();
        },
      ),
    );
  }
}
