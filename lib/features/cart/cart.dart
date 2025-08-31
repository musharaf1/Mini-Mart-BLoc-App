import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimart/data/cart_items.dart';
import 'package:minimart/features/cart/bloc/cart_bloc.dart';
import 'package:minimart/features/cart/ui/cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Items")),
      body: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        bloc: cartBloc,
        builder: (BuildContext context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;

              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartTileWidget(
                    productDataModel: cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
              );

            default:
          }
          return Container();
        },
        listener: (BuildContext context, state) {
          if (state is CartActionState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Item Removed From Cart")));
          }
        },
      ),
    );
  }
}
