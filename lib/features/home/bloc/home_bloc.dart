import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:minimart/data/cart_items.dart';
import 'package:minimart/data/grocery_data.dart';
import 'package:minimart/data/wishlist_items.dart';
import 'package:minimart/features/home/models/home_products_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishListButtonClickedEvent>(
      homeProductWishListButtonClickedEvent,
    );

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));

    emit(
      HomeLoadedSuccessfulState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
    HomeProductWishListButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wish List Clicked ");

    wishlistItems.add(event.productDataModel);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart List Clicked ");
    cartItems.add(event.productDataModel);
    emit(HomeProductItemCartlistedActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
    HomeWishListButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("WishList Navigation clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart list Navigation clicked");
    emit(HomeNavigateToCartListPageActionState());
  }
}
