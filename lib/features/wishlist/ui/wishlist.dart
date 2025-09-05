import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimart/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:minimart/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist Items")),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final successState = state as WishListSuccessState;
              return ListView.builder(
                itemCount: successState.wishlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return WishlistTileWidget(
                    productDataModel: successState.wishlist[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
              );
            default:
              SizedBox();
          }
          return SizedBox();
        },
        listener: (context, state) {
          if (state is WishlistActionState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Wish Item removed")));
          }
        },
      ),
    );
  }
}
