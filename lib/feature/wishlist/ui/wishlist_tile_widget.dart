import 'package:flutter/material.dart';
import 'package:learn_bloc/feature/home/bloc/home_bloc.dart';
import 'package:learn_bloc/feature/home/models/home_product_data_model.dart';
import 'package:learn_bloc/feature/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          Text(productDataModel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productDataModel.price}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  // IconButton(
                  //     onPressed: () {
                  //       //   homeBloc.add(HomeProductWishListButtonClickedEvent(
                  //       //       clickedProduct: productDataModel));
                  //       HomeBloc.add(WishListRemoveFromWishlistEvent(
                  //           product: productDataModel));
                  //     },
                  //     icon: Icon(Icons.shopping_bag_outlined)),
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(WishListRemoveFromWishlistEvent(
                            product: productDataModel));
                      },
                      icon: Icon(Icons.delete))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
