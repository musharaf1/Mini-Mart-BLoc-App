import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:minimart/data/wishlist_items.dart';
import 'package:minimart/features/home/models/home_products_data.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);

    on<WishlistEvent>((event, emit) {
      on<WishlistRemoveEvent>(wishlistRemoveEvent);
    });
  }

  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishListSuccessState(wishlist: wishlistItems));
  }

  FutureOr<void> wishlistRemoveEvent(
    WishlistRemoveEvent event,
    Emitter<WishlistState> emit,
  ) {
    wishlistItems.remove(event.productDataModel);

    emit(WishListSuccessState(wishlist: wishlistItems));
    emit(WishlistActionState());
  }
}
